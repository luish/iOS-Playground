//
//  BusRoutesViewModel.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 30/06/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import Foundation

class BusRouteViewModel {
    weak var delegate: BusRouteViewModelDelegate?
    var routes: [BusRouteDetailsViewModel]?
    
    private var api: APIServiceProtocol
    private var isLoading: Bool = false {
        didSet {
            self.delegate?.updateLoadingStatus(isLoading)
        }
    }
    
    init(api: APIServiceProtocol = APIMocky()) {
        self.api = api
    }
    
    func initFetch() {
        isLoading = true
        api.fetchBusRoutes { [weak self] (routes) in
            self?.isLoading = false
            self?.processFetchedRoutes(routes: routes)
        }
    }
    
    private func processFetchedRoutes(routes: [BusRoute]?) {
        self.routes = routes?.compactMap({ BusRouteDetailsViewModel(withRoute: $0) })
        self.delegate?.reloadTableView()
    }
    
    func getRouteDetailsViewModel(at indexPath: IndexPath) -> BusRouteDetailsViewModel? {
        return self.routes?[indexPath.row]
    }
}

protocol BusRouteViewModelDelegate: class {
    func reloadTableView()
    func updateLoadingStatus(_ isLoading: Bool)
}
