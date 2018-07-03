//
//  BusRouteDetailsViewModel.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 01/07/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import UIKit

struct BusRouteDetailsViewModel {
    let nameText: String
    let descriptionText: String?
    let accessible: Bool
    let imageUrl: URL?
    let stops: [String]?
    let imagePlaceholder = Images.busRoutePlaceholder
    
    var route: BusRoute? {
        didSet {
            print("ok")
        }
    }
    
    init(withRoute route: BusRoute) {
        nameText = route.name
        descriptionText = route.description
        accessible = route.accessible
        
        if let imageUrl = route.imageUrl {
            self.imageUrl = URL(string: imageUrl)
        } else {
            self.imageUrl = nil
        }
        
        stops = route.stops.map({ $0.name })
    }
}
