//
//  ImageLoader.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 01/07/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import UIKit

struct ImageLoader {
    static let cache = NSCache<NSString, UIImage>()
    
    static func load(url: URL, completion: @escaping (_ image: UIImage?) -> Void) {
        let urlString = url.absoluteString as NSString
        // return cached image straight away, or fetch it if not yet in the cache
        if let cachedImage = cache.object(forKey: urlString) {
            completion(cachedImage)
        } else {
            DispatchQueue.global(qos: .userInitiated).async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    cache.setObject(image, forKey: urlString)
                    completion(image)
                }
            }
        }
    }
}
