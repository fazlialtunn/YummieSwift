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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
        print("placeOrderBtnClicked")
    }
}
