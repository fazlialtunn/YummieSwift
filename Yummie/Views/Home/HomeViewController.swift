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
    @IBOutlet weak var specialsCollectionView: UICollectionView!
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
    var specials:[Dish]=[
        .init(id: "id1", name: "Special 1", description: "This is the most special I have ever tasted", image: "https://picsum.photos/100/200", calories: 314),
        .init(id: "id2", name: "Special 2", description: "This is the most special I have ever tasted", image: "https://picsum.photos/100/200", calories: 1124)
    ]
        

    override func viewDidLoad() {
        super.viewDidLoad()
        let networkService = NetworkService()
        let request = networkService.createRequest(route: .temp, method: .get,parameters: ["firstName":"Fazli","lastName":"Altun"])
        print("The url is \(request?.url)")
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        specialsCollectionView.dataSource = self
        specialsCollectionView.delegate = self
        registerCells()
    }
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifer)
        
    }
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
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
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifer, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default:return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }else{
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView ==
            popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

