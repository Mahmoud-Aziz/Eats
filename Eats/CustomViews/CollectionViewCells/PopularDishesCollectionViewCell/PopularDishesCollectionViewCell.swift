//
//  PopularDishesCollectionViewCell.swift
//  Eats
//
//  Created by Mahmoud Aziz on 18/06/2021.
//

import UIKit

class PopularDishesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dishImageView: UIImageView!
    @IBOutlet private weak var caloriesLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    func setup(dish: Dish) {
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asURL)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
}
