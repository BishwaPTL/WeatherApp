//
//  DashboardViewController.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 02/01/24.
//

import UIKit

class DashboardViewController: UIViewController {

    let viewModel = DashboardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getWeatherData()
    }
}
