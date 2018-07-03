//
//  TimelineCell.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 02/07/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var marker: TimelineMarker!
    
    override func prepareForReuse() {
        marker.isLastItem = false
    }
}
