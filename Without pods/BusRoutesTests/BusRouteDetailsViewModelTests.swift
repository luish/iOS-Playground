//
//  PageViewContentTests.swift
//  PageViewContentTests
//
//  Created by Luis Henrique Borges on 30/06/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import XCTest
@testable import BusRoutes

class PageViewContentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewModelInit() {
        let route = BusRoute(id: "1", accessible: true, imageUrl: "http://example.com/image.png", name: "Route 1", description: "Long description here", stops: [BusStop(name: "Stop A")])
        let viewModel = BusRouteDetailsViewModel(withRoute: route)
        
        XCTAssertEqual(viewModel.nameText, route.name)
        XCTAssertEqual(viewModel.descriptionText, route.description)
        XCTAssertEqual(viewModel.accessible, route.accessible)
        XCTAssertEqual(viewModel.stops, [route.stops.first!.name])
        XCTAssertEqual(viewModel.imageUrl, URL(string: route.imageUrl!))
    }
    
}
