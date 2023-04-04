//
//  MockMenuResponseModel.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import Foundation

struct MockMenuResponseModel {
    static let menuResponse: MenuResponse = MenuResponse(
        products: [
            //MARK: - Pizza
            ProductResponse(
                title: "Ветчина и грибы",
                category: "Пицца",
                description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                imageURLString: "pizzaHM",
                startPrice: 350
            ),
            ProductResponse(
                title: "Баварские колбаски",
                category: "Пицца",
                description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус",
                imageURLString: "pizzaBV",
                startPrice: 350
            ),
            ProductResponse(
                title: "Нежный лосось",
                category: "Пицца",
                description: "Лосось, томаты черри, моцарелла, соус песто",
                imageURLString: "pizzaFish",
                startPrice: 350
            ),
            ProductResponse(
                title: "Пицца четыре сыра",
                category: "Пицца",
                description: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)",
                imageURLString: "pizza4cheeses",
                startPrice: 350
            ),
            
            //MARK: - Drinks
            ProductResponse(
                title: "Pepsi",
                category: "Напитки",
                description: "Pepsi, 0,33",
                imageURLString: "pepsi",
                startPrice: 90
            ),
            ProductResponse(
                title: "Coca-cola",
                category: "Напитки",
                description: "Coca-cola, 0,33",
                imageURLString: "cola",
                startPrice: 90
            ),
            ProductResponse(
                title: "Sprite",
                category: "Напитки",
                description: "Sprite, 0,33",
                imageURLString: "sprite",
                startPrice: 90
            ),
            
            //MARK: - Combo
            ProductResponse(
                title: "Комбо номер 1",
                category: "Комбо",
                description: "Ооочень большое комбо",
                imageURLString: "bigCombo",
                startPrice: 1000
            ),
            ProductResponse(
                title: "Комбо номер 2",
                category: "Комбо",
                description: "Среднее комбо, 1кг",
                imageURLString: "mediumCombo",
                startPrice: 800
            ),
            
            //MARK: - Desserts
            ProductResponse(
                title: "Вишневый торт",
                category: "Десерты",
                description: "Вишня и много других вкусных ингридиентов",
                imageURLString: "cherryCake",
                startPrice: 130
            ),
            ProductResponse(
                title: "Медовик",
                category: "Десерты",
                description: "Очень сытный и вкусный торт \"Медовик\"",
                imageURLString: "honey",
                startPrice: 130
            ),
            ProductResponse(
                title: "Круасан",
                category: "Десерты",
                description: "МММ, французская вкуснятина",
                imageURLString: "croissant",
                startPrice: 130
            )
        ],
        offset: 0
    )
}
