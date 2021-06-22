//
//  AppError.swift
//  Eats
//
//  Created by Mahmoud Aziz on 20/06/2021.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoding"
        case .unknownError:
            return "Unknown error eccured"
        case .invalidUrl:
            return "Invalid URL"
        case .serverError(let error):
            return error
        }
    }
}
