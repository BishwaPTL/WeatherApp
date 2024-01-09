//
//  ForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 09/01/24.
//

import UIKit

class ForecastTableViewCell: UITableViewCell, CellData {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: DashboardViewModel?
}

//MARK: UICollectionViewDataSource
extension ForecastTableViewCell : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ForecastCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.forecastCollectionViewCell, for: indexPath) as! ForecastCollectionViewCell
        cell.timeLabel.text = viewModel?.getForecastTime(at: indexPath.item)
        cell.tempLabel.text = viewModel?.getForecastTempWithUnits(at: indexPath.item)
        cell.weatherImageView.loadImage(fromUrl: viewModel?.getForecastIconUrl(at: indexPath.item))
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension ForecastTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 200)
    }
}
