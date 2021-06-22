//
//  AllDishes.swift
//  Eats
//
//  Created by Mahmoud Aziz on 20/06/2021.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]? 
}
