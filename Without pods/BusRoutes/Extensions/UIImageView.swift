//
//  UIImageView.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 03/07/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        ImageLoader.load(url: url) { [weak self] image in
            if let image = image {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
