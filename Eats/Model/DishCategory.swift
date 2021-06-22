//
//  DishCategory.swift
//  Eats
//
//  Created by Mahmoud Aziz on 18/06/2021.
//

import Foundation

struct DishCategory: Decodable {
    let id, name, image: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "title"
        case image
    }
}
