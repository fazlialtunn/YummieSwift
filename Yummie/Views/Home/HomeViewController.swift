//
//  HomeViewController.swift
//  Yummie
//
//  Created by Fazlı Altun on 3.07.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    var categories:[DishCategory] = [
        .init(id: "id1", name: "Turkish Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Turkish Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Turkish Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Turkish Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Turkish Dish 5", image: "https://picsum.photos/100/200")
    ]
    var populars:[Dish] = [
        .init(id: "id1", name: "Popular 1", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id2", name: "Popular 2", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 314),
        .init(id: "id3", name: "Popular 3", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 1124),
    ]
        

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        registerCells()
    }
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        
    }
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        default:return 0
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        default:return UICollectionViewCell()
        }
        
    }
}

