//
//  Utility.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 07/01/24.
//

import Foundation
import UIKit

class Utility {
    
    static func showAlert(withMessage : String?, onController:UIViewController) {
        let alertController = UIAlertController(title: "WeatherApp", message: withMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        onController.present(alertController, animated: true, completion: nil)
    }
    
    static func showAlert(title: String, withMessage : String?, onController:UIViewController, actions:[UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: withMessage, preferredStyle: .alert)
        for action in actions {
            alertController.addAction(action)
        }
        onController.present(alertController, animated: true, completion: nil)
    }
}
