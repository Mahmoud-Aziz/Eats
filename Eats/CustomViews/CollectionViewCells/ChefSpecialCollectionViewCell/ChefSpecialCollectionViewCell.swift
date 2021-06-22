//
//  ChefSpecialCollectionViewCell.swift
//  Eats
//
//  Created by Mahmoud Aziz on 18/06/2021.
//

import UIKit

class ChefSpecialCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var dishImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var caloriesLabel: UILabel!
    
     func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }

}
