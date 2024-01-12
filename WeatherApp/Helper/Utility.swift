//
//  Utility.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 12/01/24.
//

import UIKit

class Utility {
    
    static func showAlert(withMessage : String?, onController: UIViewController) {
        let alertController = UIAlertController(title: "WeatherApp", message: withMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        onController.present(alertController, animated: true, completion: nil)
    }
}
