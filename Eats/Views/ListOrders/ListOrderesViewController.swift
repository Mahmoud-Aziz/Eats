//
//  ListOrderesViewController.swift
//  Eats
//
//  Created by Mahmoud Aziz on 20/06/2021.
//

import UIKit

class ListOrderesViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id1", name: "order1", dish: Dish(id: "ID1", name: "Pizza", description: "pizzaa pizzaa pizzaa pizzaa pizzaa pizzaa pizzaa pizzaa", image: "https://picsum.photos/100/200", calories: 30)),
        .init(id: "id1", name: "order1", dish: Dish(id: "ID1", name: "Pizza", description: "pizzaa pizzaa pizzaa pizzaa pizzaa pizzaa pizzaa pizzaa", image: "https://picsum.photos/100/200", calories: 30)),   .init(id: "id1", name: "order1", dish: Dish(id: "ID1", name: "Pizza", description: "pizzaa pizzaa pizzaa pizzaa pizzaa pizzaa pizzaa pizzaa", image: "https://picsum.photos/100/200", calories: 30))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orders"
        registerCell()
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "DishTableViewCell", bundle: nil), forCellReuseIdentifier: "DishTableViewCell")
    }
}

extension ListOrderesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DishTableViewCell", for: indexPath) as! DishTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
