//
//  AllDishes.swift
//  Yummie
//
//  Created by Fazlı Altun on 10.07.2023.
//

import Foundation


struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
