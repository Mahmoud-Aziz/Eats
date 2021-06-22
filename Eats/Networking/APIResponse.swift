//
//  APIResponse.swift
//  Eats
//
//  Created by Mahmoud Aziz on 20/06/2021.
//

import Foundation

struct APIRespone<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String? 
}
