//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by Fazlı Altun on 6.07.2023.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders:[Order] = [
        .init(id: "id1", name: "Fazlı Altun", dish:  .init(id: "id1", name: "Popular 1", description: "This is the best I 1 have ever tasted", image: "https://picsum.photos/100/200", calories: 31)),
        .init(id: "id2", name: "Fatih Altun", dish:  .init(id: "id2", name: "Popular 2", description: "This is the best I 2 have ever tasted", image: "https://picsum.photos/100/200", calories: 32)),
        .init(id: "id3", name: "Fedai Altun", dish:  .init(id: "id3", name: "Popular 3", description: "This is the best I 3 have ever tasted", image: "https://picsum.photos/100/200", calories: 33)),
        .init(id: "id4", name: "Emine Altun", dish:  .init(id: "id4", name: "Popular 4", description: "This is the best I 4 have ever tasted", image: "https://picsum.photos/100/200", calories: 34))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orders"
        registerCells()
        
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifer, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifer)
    }
    
}

extension ListOrdersViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifer) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
