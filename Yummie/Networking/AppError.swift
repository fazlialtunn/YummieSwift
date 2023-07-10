//
//  AppError.swift
//  Yummie
//
//  Created by Fazlı Altun on 10.07.2023.
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
            return "Response could not be decoded"
        case .unknownError:
            return "I have no idea whats going on"
        case .invalidUrl:
            return "Give me a valid URL"
        case .serverError(let error):
            return error
        }
    }
}
