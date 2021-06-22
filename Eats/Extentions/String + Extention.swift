//
//  String + Extention.swift
//  Eats
//
//  Created by Mahmoud Aziz on 18/06/2021.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
