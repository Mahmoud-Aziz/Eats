//
//  ListDishesViewController.swift
//  Eats
//
//  Created by Mahmoud Aziz on 19/06/2021.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet private weak var dishesTableView: UITableView!
    var dishCategory: DishCategory!
    var dishes: [Dish] = [
        .init(id: "id1", name: "meat", description: "best meat in  town", image: "https://picsum.photos/100/200", calories: 34),
            .init(id: "id2", name: "pizza", description: "best meat in  town best meat in  town best meat in  town best meat in  town best meat in  town", image: "https://picsum.photos/100/200", calories: 34),
            .init(id: "id3", name: "chicken", description: "best meat in  town", image: "https://picsum.photos/100/200", calories: 34),
            .init(id: "id4", name: "fish", description: "best meat in  town", image: "https://picsum.photos/100/200", calories: 34)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = dishCategory.name
        registerCells()
    }
    
    private func registerCells() {
        dishesTableView.register(UINib(nibName: "DishTableViewCell", bundle: nil), forCellReuseIdentifier: "DishTableViewCell")
    }
}


extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DishTableViewCell") as! DishTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
