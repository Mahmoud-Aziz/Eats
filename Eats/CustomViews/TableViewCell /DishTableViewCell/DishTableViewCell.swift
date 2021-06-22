//
//  DishTableViewCell.swift
//  Eats
//
//  Created by Mahmoud Aziz on 19/06/2021.
//

import UIKit

class DishTableViewCell: UITableViewCell {

    @IBOutlet private weak var dishImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
    }
    
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish.image?.asURL)
        titleLabel.text = order.dish.name
        descriptionLabel.text = order.name
    }
    
}
