//
//  ViewController.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 30/06/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import UIKit
import Kingfisher

class BusRouteViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var routeImageView: UIImageView!
    @IBOutlet weak var accessibilityImageView: UIImageView!
    
    weak var stopsTimelineViewController: BusStopsTimelineViewController?
    
    public var viewModel: BusRouteDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = viewModel?.nameText
        descriptionLabel.text = viewModel?.descriptionText
        accessibilityImageView.isHidden = !(viewModel?.accessible ?? false)
        
        if let imageUrl = viewModel?.imageUrl {
             routeImageView.kf.setImage(with: imageUrl, placeholder: viewModel?.imagePlaceholder)
        }
        
        if let timelineViewController = childViewControllers.first as? BusStopsTimelineViewController {
            stopsTimelineViewController = timelineViewController
            stopsTimelineViewController?.stops = viewModel?.stops
        }
    }
}
