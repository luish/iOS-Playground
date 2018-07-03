//
//  UITableView.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 03/07/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell(forCell cellIdentifier: Cells, at indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: cellIdentifier.rawValue, for: indexPath)
    }
}
