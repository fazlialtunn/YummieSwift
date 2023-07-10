//
//  ApiResponse.swift
//  Yummie
//
//  Created by Fazlı Altun on 10.07.2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
