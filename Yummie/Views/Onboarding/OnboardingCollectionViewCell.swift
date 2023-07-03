//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Fazlı Altun on 2.07.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    func setup(_ slide:OnboardingSlide){
        slideImageView.image=slide.image
        slideTitleLbl.text=slide.title
        slideDescriptionLbl.text=slide.description
    }
}
