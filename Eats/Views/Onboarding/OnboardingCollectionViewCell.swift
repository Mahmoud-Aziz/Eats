//
//  OnboardingCollectionViewCell.swift
//  Eats
//
//  Created by Mahmoud Aziz on 16/06/2021.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var slideImageView: UIImageView!
    @IBOutlet private weak var slideTitleLabel: UILabel!
    @IBOutlet private weak var slideDescription: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescription.text = slide.description
    }
}

