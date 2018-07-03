//
//  PageViewController.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 30/06/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    var viewModel: BusRouteViewModel?
    var selectedIndex: Int?
    
    private(set) lazy var orderedViewControllers: [UIViewController]? = {
        guard let routes = viewModel?.routes else { return nil }
        return routes.map({ [weak self] (route) in
            return self?.newViewController(routeViewModel: route)
        }).compactMap({ $0 })
    }()
    
    private func newViewController(routeViewModel: BusRouteDetailsViewModel) -> UIViewController? {
        if let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "details") as? BusRouteViewController {
            viewController.viewModel = routeViewModel
            return viewController
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
        if let orderedViewControllers = orderedViewControllers {
            let index = selectedIndex ?? 0
            let selectedViewController = orderedViewControllers[index]
            setViewControllers([selectedViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
            navigationItem.title = viewModel?.getRouteDetailsViewModel(at: IndexPath(row: index))?.nameText
        }
    }
}

extension PageViewController: UIPageViewControllerDataSource {
        
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard viewController != orderedViewControllers?.first else { return nil }
        
        if let viewControllerIndex = orderedViewControllers?.index(of: viewController) {
            let previousIndex = viewControllerIndex - 1
            return orderedViewControllers?[previousIndex]
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard viewController != orderedViewControllers?.last else { return nil }
        if let viewControllerIndex = orderedViewControllers?.index(of: viewController) {
            let nextIndex = viewControllerIndex + 1
            return orderedViewControllers?[nextIndex]
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if completed, let activeViewController = pageViewController.viewControllers?.first {
            if let viewControllerIndex = orderedViewControllers?.index(of: activeViewController) {
                let viewModel = self.viewModel?.getRouteDetailsViewModel(at: IndexPath(row: viewControllerIndex))
                navigationItem.title = viewModel?.nameText
            }
        }
    }
}
