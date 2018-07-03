//
//  Circle.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 02/07/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import UIKit

@IBDesignable
open class Circle: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = self.frame.width / 2
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
