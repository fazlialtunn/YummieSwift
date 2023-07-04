//
//  UIViewController+Extension.swift
//  Yummie
//
//  Created by Fazlı Altun on 4.07.2023.
//

import UIKit

extension UIViewController{
    
    static var identifier: String{
        return String(describing: self)
    }
    static func instantiate()->Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        
        
    }
}
