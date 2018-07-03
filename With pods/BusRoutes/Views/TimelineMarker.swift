//
//  TimelineMarker.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 02/07/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import UIKit

@IBDesignable
open class TimelineMarker: UIView {
    
    @IBOutlet weak var verticalLine: UIView!
    
    @IBInspectable var isLastItem: Bool = false {
        didSet {
            weak var verticalLine = self.verticalLine
            verticalLine?.isHidden = self.isLastItem
            self.setNeedsDisplay()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
