//
//  CurrentWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 07/01/24.
//

import UIKit

protocol CellData {
    var viewModel: DashboardViewModel? { get set }
}

class CurrentWeatherTableViewCell: UITableViewCell, CellData {
    
    //MARK: Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var weatherImageView: LazyImageView!
    
    var viewModel: DashboardViewModel? {
        didSet {
            feedView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resetView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetView()
    }
    
    private func resetView() {
        self.dateLabel.text = ""
        self.tempLabel.text = ""
        self.cityNameLabel.text = ""
        self.statusLabel.text = ""
        self.weatherImageView.image = nil
    }
    
    private func feedView() {
        cityNameLabel.text = viewModel?.cityName
        statusLabel.text = viewModel?.weatherCondition
        dateLabel.text = viewModel?.getLocalDate()
        tempLabel.text = viewModel?.tempWithUnits
        weatherImageView.loadImage(fromUrl: viewModel?.weatherIconUrl)
    }
}
