//
//  UIView + Extention.swift
//  Eats
//
//  Created by Mahmoud Aziz on 14/06/2021.
//

import Foundation
import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
    get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
