//
//  HomeViewController.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 30/06/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var viewModel = BusRouteViewModel(api: APIMocky())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
        viewModel.delegate = self
        viewModel.initFetch()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.routes?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(forCell: .busRouteCell,
                                                       at: indexPath) as? BusRouteCell,
        let cellViewModel = viewModel.getRouteDetailsViewModel(at: indexPath) else {
            fatalError("Failed when reusing cell")
        }
        
        cell.nameLabel.text = cellViewModel.nameText
        
        if let imageUrl = cellViewModel.imageUrl {
            cell.routeImageView.load(url: imageUrl)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageViewController = segue.destination as? PageViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            pageViewController.viewModel = viewModel
            pageViewController.selectedIndex = indexPath.row
        }
    }
}

extension HomeViewController: BusRouteViewModelDelegate {
    func reloadTableView() {
        weak var weakSelf = self
        DispatchQueue.main.async {
            weakSelf?.tableView.reloadData()
        }
    }
        
    func updateLoadingStatus(_ isLoading: Bool) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        }
    }
}
