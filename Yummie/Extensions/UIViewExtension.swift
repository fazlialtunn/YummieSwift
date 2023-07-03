//
//  UIViewExtension.swift
//  Yummie
//
//  Created by Fazlı Altun on 2.07.2023.
//

import UIKit

extension UIView{
   @IBInspectable var cornerRadius: CGFloat{
        get{
            return self.cornerRadius
        }
        set{
            self.layer.cornerRadius=newValue
            
        }
    }
}
