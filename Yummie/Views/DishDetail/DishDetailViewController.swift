//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by Fazlı Altun on 4.07.2023.
//

import UIKit

class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateView()
        
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
}
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
        print("placeOrderBtnClicked")
    }
}
