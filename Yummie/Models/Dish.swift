//
//  Dish.swift
//  Yummie
//
//  Created by Fazlı Altun on 4.07.2023.
//

import Foundation

struct Dish{
    let id,name,description,image:String?
    let calories:Int?
    var formattedCalories:String{
        return "\(calories ?? 0) calories"
    }
}
