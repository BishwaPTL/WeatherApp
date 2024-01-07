//
//  DashboardViewController.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import UIKit

class DashboardViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var searchTextField: UITextField!
    
    let viewModel = DashboardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.searchTextField.placeholder = viewModel.placeholderText()
    }
    
    @IBAction func didSelectSearch(_ sender: UIControl) {
        if let text = searchTextField.text, !text.isEmpty {
            getWeatherData(for: text)
        }
    }
    
    private func getWeatherData(for city: String) {
        viewModel.getWeatherData(for: city) { success in
            
        }
    }
}

//MARK: UITextFieldDelegate
extension DashboardViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}
