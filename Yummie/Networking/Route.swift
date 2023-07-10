//
//  Route.swift
//  Yummie
//
//  Created by Fazlı Altun on 6.07.2023.
//

import Foundation


enum Route {
    
    static let baseUrl = "https://yummie.glitch.me"
    
    case temp
    
    var description: String {
        switch self {
            
        case .temp: return "/dish-categories"
            
        }
    }
}