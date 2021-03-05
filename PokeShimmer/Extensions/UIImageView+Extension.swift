//
//  UIImageView+Extension.swift
//  PokeShimmer
//
//  Created by lucas.lima on 05/03/21.
//  Copyright © 2021 lucas.lima. All rights reserved.
//

import UIKit

class ImageStore: NSObject {
    static let imageCache = NSCache<NSString, UIImage>()
}

extension UIImageView {
    func downloadImage(from url: String?) {
        DispatchQueue.global().async { [weak self] in
            guard let stringURL = url, let url = URL(string: stringURL) else {
                return
            }
            func setImage(image:UIImage?) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
            let urlToString = url.absoluteString as NSString
            /*if let cachedImage = ImageStore.imageCache.object(forKey: urlToString) {
                setImage(image: cachedImage)
            } else */if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    ImageStore.imageCache.setObject(image, forKey: urlToString)
                    setImage(image: image)
                }
            } else {
                setImage(image: nil)
            }
        }
    }
}
