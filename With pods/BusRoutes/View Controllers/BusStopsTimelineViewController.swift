//
//  BusRouteTimelineView.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 02/07/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import UIKit

class BusStopsTimelineViewController: UITableViewController {
    var stops: [String]?

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stops?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(forCell: .timelineCell,
                                                       at: indexPath) as? TimelineCell,
            let stop = stops?[indexPath.row],
            (stops?.count ?? 0) > indexPath.row else {
                fatalError("Cell not exists in storyboard")
        }
        
        cell.nameLabel.text = stop
        cell.marker.isLastItem = indexPath.row + 1 == stops?.count
        return cell
    }
}
