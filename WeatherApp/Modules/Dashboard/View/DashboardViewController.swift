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
    @IBOutlet weak var tableView: UITableView!
    
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
        viewModel.getWeatherData(for: city) { [weak self] success in
            if let this = self {
                if success {
                    this.tableView.reloadData()
                } else {
                    Utility.showAlert(withMessage: this.viewModel.genericErrorText(), onController: this)
                }
            }
        }
    }
}

//MARK: TableViewDataSource:
extension DashboardViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int{
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: CurrentWeatherTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.currentWeatherTableViewCell) as! CurrentWeatherTableViewCell
            cell.viewModel = viewModel
            return cell
        } else if indexPath.section == 1 {
            let cell: HourlyHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.hourlyHeaderTableViewCell) as! HourlyHeaderTableViewCell
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

//MARK: UITextFieldDelegate
extension DashboardViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}
