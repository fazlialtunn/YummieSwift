//
//  StringExtension.swift
//  Yummie
//
//  Created by Fazlı Altun on 4.07.2023.
//

import Foundation

extension String{
    var asUrl: URL?{
        return URL(string: self)
    }
}
