//
//  StartCoordinator.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 10.03.2022.
//

import UIKit

protocol StartFlow: AnyObject {
    func coordinateToTabBar()
}

class StartCoordinator: Coordinator, StartFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let startViewController = HomeViewController()
        startViewController.coordinator = self
        navigationController.pushViewController(startViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    func coordinateToTabBar() {
        let teslaCoordinator = TeslaListCoordinator(navigationController: navigationController)
        coordinate(to: teslaCoordinator)
    }
}

