//
//  IndexPath.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 02/07/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import UIKit

extension IndexPath {
    init(row: Int) {
        self.init(row: row, section: 0)
    }
}
