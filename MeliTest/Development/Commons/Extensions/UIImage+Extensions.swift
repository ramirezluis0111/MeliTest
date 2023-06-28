//
//  UIImage+Extensions.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import UIKit
import Alamofire

extension UIImageView {
    func downloadImageFromUrl(from url: String,
                              completion: ((Bool) -> Void)? = nil) {
        AF.request(url).response { response in
            switch response.result {
            case .success(_):
                DispatchQueue.main.async { [weak self] in
                    guard let self,
                          let data = response.data,
                          let image = UIImage(data: data) else { return }
                    self.applyAnimation(with: image)
                    completion?(true)
                }
            case .failure(_):
                completion?(false)
            }
        }
    }

    func applyAnimation(with image: UIImage) {
        UIView.transition(with: self,
                          duration: 0.25,
                          options: .transitionCrossDissolve) { [weak self] in
            guard let self else { return }
            self.image = image
        }
    }
}
