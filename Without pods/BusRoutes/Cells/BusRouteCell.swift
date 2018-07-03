//
//  BusRouteCell.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 30/06/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import UIKit

class BusRouteCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var routeImageView: UIImageView!
    
    override func prepareForReuse() {
        routeImageView.image = Images.busRoutePlaceholder
    }
}
