//
//  Order.swift
//  Eats
//
//  Created by Mahmoud Aziz on 20/06/2021.
//

import Foundation

struct Order: Decodable {
    let id, name: String?
    let dish: Dish
}
