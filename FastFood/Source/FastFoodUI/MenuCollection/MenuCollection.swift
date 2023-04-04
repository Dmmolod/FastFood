//
//  MenuCollection.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

protocol MenuCollectionBasePresenterProtocol {
    func didSelectItem(at indexPath: IndexPath)
    func topProductDidChanged(at indexPath: IndexPath)
    func isNeedToRoundCorners(at indexPath: IndexPath) -> Bool
}

protocol MenuCollectionBaseViewProtocol {
    func setData(_ data: [MenuData])
    func scroll(to indexPath: IndexPath)
}

typealias MenuCollectionPresenterProtocol = MenuCollectionBasePresenterProtocol & MenuCategoriesPresenterProtocol
typealias MenuCollectionViewProtocol = MenuCollectionBaseViewProtocol & MenuCategoriesViewProtocol

final class MenuCollection: UIView {
    
    var presenter: MenuCollectionPresenterProtocol?
    
    private(set) var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<MenuSection, MenuSection.Item>!
    private var categoriesHeader: MenuCategoriesCollectionHeaderView?
    private var sectionStore: [MenuSection] = []
    
    init() {
        super.init(frame: .zero)
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: createCollectionLayout()
        )
        collectionView.backgroundColor = .appBackground
        
        setupCollection()
        setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func topProductChanged() {
        guard let currentTopItemIndexPath = collectionView.indexPathsForVisibleItems.sorted(by: <).first else { return }
        if dataSource.snapshot().indexOfSection(.menu) != currentTopItemIndexPath.section { return }
        
        presenter?.topProductDidChanged(at: currentTopItemIndexPath)
    }
}

extension MenuCollection: MenuCollectionBaseViewProtocol {

    func setData(_ data: [MenuData]) {
        var snapshot = NSDiffableDataSourceSnapshot<MenuSection, MenuSection.Item>()
        var sections: [MenuSection] = []
        
        for model in data {
            if sections.contains(model.section) { continue }
            
            snapshot.appendSections([model.section])
            snapshot.appendItems(model.items)
            sections.append(model.section)
        }
        
        sectionStore = sections
        dataSource.apply(snapshot)
    }

    func scroll(to indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
    }
}

extension MenuCollection: MenuCategoriesViewProtocol {
    func setCategories(titles: [String]) {
        self.categoriesHeader?.setCategories(titles: titles)
    }
    
    func selectCategory(at index: Int) throws {
        try categoriesHeader?.selectCategory(at: index)
    }
}

extension MenuCollection: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectItem(at: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.isDecelerating { topProductChanged() }
        
        if dataSource.snapshot().indexOfSection(.promo) == 0
            && dataSource.snapshot().indexOfSection(.menu) == 1 {
            guard let headerHeight = collectionView.layoutAttributesForItem(
                at: IndexPath(
                    item: 0,
                    section: 0
                )
            )?.frame.height else { return }
            
            let currentValue = scrollView.contentOffset.y
            let progress = (currentValue * 100) / headerHeight
            let maxValue: CGFloat = 0.2
            let percent = maxValue * (progress/100)
            let newOpacity = Float(max(0, min(percent, 0.2)))
            
            categoriesHeader?.layer.shadowOpacity = newOpacity
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        topProductChanged()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        topProductChanged()
    }
}

//MARK: - Private Setup Collection
private extension MenuCollection {
    
    func setupCollection() {
        collectionView.register(BannerCollectionCell.self)
        collectionView.register(ProductCollectionCell.self)
        collectionView.register(MenuCategoriesCollectionHeaderView.self)
        collectionView.delegate = self
        
        configureDataSource()
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { [unowned self] collectionView, indexPath, item in
            return self.cell(collectionView: collectionView, indexPath: indexPath, item: item)
        }
        
        dataSource.supplementaryViewProvider = { [unowned self] collectionView, kind, indexPath in
            if kind == UICollectionView.elementKindSectionFooter { return nil }
            
            if self.dataSource.snapshot().indexOfSection(.menu) != indexPath.section { return nil }
            
            let header: MenuCategoriesCollectionHeaderView? = collectionView.dequeueHeader(for: indexPath)
            header?.presenter = self.presenter
            
            self.categoriesHeader = header
            
            return header
        }
    }
    
    func cell(collectionView: UICollectionView, indexPath: IndexPath, item: MenuSection.Item) -> UICollectionViewCell {
        var cell: UICollectionViewCell?
        
        switch item {
        case let .banner(imageURL):
            let tempCell: BannerCollectionCell? = collectionView.dequeue(for: indexPath)
            tempCell?.config(imageURL)
            
            cell = tempCell
        case let .product(model):
            let tempCell: ProductCollectionCell? = collectionView.dequeue(for: indexPath)
            tempCell?.config(model)
            
            if let needRound = presenter?.isNeedToRoundCorners(at: indexPath) {
                tempCell?.roundedCorners(needRound)
            }
            
            cell = tempCell
        }
        
        return cell ?? UICollectionViewCell()
    }
}

//MARK: - Private Layout
private extension MenuCollection {
    
    func setupLayout() {
        addSubview(collectionView) {
            $0.edges.equalToSuperview()
        }
    }
    
    func createCollectionLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { [unowned self] sectionIndex, environment in
            guard sectionStore.count > sectionIndex else { return nil }
            
            let section = sectionStore[sectionIndex]
            
            switch section {
            case .promo: return self.createLayoutForPromo()
            case .menu: return self.createLayoutForMenu()
            }
        }
    }
    
    func createLayoutForPromo() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(112)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.8),
            heightDimension: .estimated(10)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 24,
            leading: 16,
            bottom: 0,
            trailing: 16
        )
        
        return section
    }
    
    func createLayoutForMenu() -> NSCollectionLayoutSection  {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(50)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(50)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(32)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        header.pinToVisibleBounds = true
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}
