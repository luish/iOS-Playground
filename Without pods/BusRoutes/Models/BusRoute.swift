//
//  BusRoute.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 30/06/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import Foundation

struct BusRoute: Codable, Equatable {
    var id: String
    var accessible: Bool
    var imageUrl: String?
    var name: String
    var description: String
    var stops: [BusStop]
}
