//
//  DishDetailsViewController.swift
//  Eats
//
//  Created by Mahmoud Aziz on 19/06/2021.
//

import UIKit
import ProgressHUD

class DishDetailsViewController: UIViewController {

    @IBOutlet private weak var dishImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var caloriesLabel: UILabel!
    @IBOutlet private weak var DescriptionLabel: UILabel!
    @IBOutlet private weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titleLabel.text = dish.name
        DescriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }

    @IBAction private func placeOrderClicked(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        ProgressHUD.show("Placing Order...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "" , name: name, completion: { result in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been recieved.")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        })
    }

}
