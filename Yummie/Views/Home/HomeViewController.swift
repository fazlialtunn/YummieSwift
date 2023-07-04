//
//  HomeViewController.swift
//  Yummie
//
//  Created by Fazlı Altun on 3.07.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories:[DishCategory] = [
        .init(id: "id1", name: "Turkish Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Turkish Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Turkish Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Turkish Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Turkish Dish 5", image: "https://picsum.photos/100/200")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        registerCells()
    }
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.setup(category: categories[indexPath.row])
        return cell
    }
}
