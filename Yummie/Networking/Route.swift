//
//  Route.swift
//  Yummie
//
//  Created by Fazlı Altun on 6.07.2023.
//

import Foundation


enum Route {
    
    static let baseUrl = "https://yummie.glitch.me"
    
    case fetchAllCategories
    
    var description: String {
        switch self {
        case .fetchAllCategories: return "/dish-categories"
            
        }
    }
}
