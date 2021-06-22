//
//  CategoryCollectionViewCell.swift
//  Eats
//
//  Created by Mahmoud Aziz on 18/06/2021.

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var categoryImageView: UIImageView!
    @IBOutlet private weak var categoryTitleLabel: UILabel!
    
    func setup(category: DishCategory) {
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asURL)
    }
}
