//
//  CachableImageView.swift
//  LogoQuiz
//
//  Created by Sushobhit.Jain on 20/11/21.
//

import Foundation

import Foundation
import UIKit

class CachableImageView: UIImageView {

    // MARK: - Constants

    static let imageCache = NSCache<NSString, AnyObject>()

    // MARK: - Properties

    var imageURLString: String?

    func downloadImageFrom(urlString: String, imageMode: UIView.ContentMode) {
        guard let url = URL(string: urlString) else { return }
        downloadImageFrom(url: url, imageMode: imageMode)
    }

    func downloadImageFrom(url: URL, imageMode: UIView.ContentMode) {
        imageURLString = url.absoluteString
        contentMode = imageMode
        if let cachedImage = CachableImageView.imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            self.image = cachedImage
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data)
                    CachableImageView.imageCache.setObject(imageToCache!, forKey: url.absoluteString as NSString)
                    if self.imageURLString == url.absoluteString {
                        self.image = imageToCache
                    }
                }
            }.resume()
        }
    }
}
