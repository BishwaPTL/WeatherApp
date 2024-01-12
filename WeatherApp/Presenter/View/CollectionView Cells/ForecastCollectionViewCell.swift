//
//  ForecastCollectionViewCell.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 09/01/24.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImageView: LazyImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resetView()
    }
    
    private func resetView() {
        self.timeLabel.text = ""
        self.tempLabel.text = ""
        self.weatherImageView.image = nil
    }
}
