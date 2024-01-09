//
//  ImageDownloadManager.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 08/01/24.
//

import Foundation
import UIKit

class ImageDownloadManager {
    static let shared = ImageDownloadManager()
    private init() {}
    
    func downloadImage(url: URL, completionHandler : @escaping (UIImage?) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let imageData = data, let image = UIImage(data: imageData) {
                completionHandler(image)
            }
            else {
                completionHandler(nil)
            }
        }
        task.resume()
    }
}


class LazyImageView: UIImageView {
    
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    func loadImage(fromUrl imageUrl: URL?) {
        self.image = nil

        if let cachedImage = self.imageCache.object(forKey: imageUrl as AnyObject) {
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            guard let url = imageUrl else {return}
            ImageDownloadManager.shared.downloadImage(url: url) { image in
                DispatchQueue.main.sync {
                    guard let image = image else {return}
                    self?.imageCache.setObject(image, forKey: imageUrl as AnyObject)
                    self?.image = image
                }
            }
        }
    }
}
