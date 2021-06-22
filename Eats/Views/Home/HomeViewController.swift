//
//  HomeViewController.swift
//  Eats
//
//  Created by Mahmoud Aziz on 16/06/2021.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet private weak var categoryCollectionView: UICollectionView!
    @IBOutlet private weak var popularCollectionView: UICollectionView!
    @IBOutlet private weak var chefSpecialCollectionView: UICollectionView!
    
    var categories: [DishCategory] = []
    var popularDishes: [Dish] = []
    var specials: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.popularDishes = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.chefSpecialCollectionView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
        popularCollectionView.register(UINib(nibName: "PopularDishesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularDishesCollectionViewCell")
        
        chefSpecialCollectionView.register(UINib(nibName: "ChefSpecialCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ChefSpecialCollectionViewCell")
    }
}


//MARK:- CollectionView DataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return popularDishes.count
        case chefSpecialCollectionView:
            return specials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
            
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularDishesCollectionViewCell", for: indexPath) as! PopularDishesCollectionViewCell
            cell.setup(dish: popularDishes[indexPath.row])
            return cell
        
        case chefSpecialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChefSpecialCollectionViewCell", for: indexPath) as! ChefSpecialCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        
        default: return UICollectionViewCell()
        }
    }
}

//MARK:- CollectionView Delegate

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.dishCategory = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailsViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? popularDishes[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
