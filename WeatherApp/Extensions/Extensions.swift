//
//  Extensions.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 09/01/24.
//

import UIKit

extension UIView {
    
    @IBInspectable var borderRadius: CGFloat {
        get {
            return self.borderRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
