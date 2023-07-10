//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by Fazlı Altun on 5.07.2023.
//

import UIKit

class ListDishesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var category:DishCategory!
    
    var dishes:[Dish] = [
        .init(id: "id1", name: "Popular 1", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id2", name: "Popular 2", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 314),
        .init(id: "id3", name: "Popular 3", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 1124)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title=category.title
        registerCells()

    }
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifer, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifer)
    }
    
}

extension ListDishesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:DishListTableViewCell.identifer) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
