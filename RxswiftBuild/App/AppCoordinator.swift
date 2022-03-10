//
//  MainCoordinator.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 09.03.2022.
//


import UIKit


class AppCoordinator: Coordinator {
  var navigationController = UINavigationController()
    
    func start() {
        let startCoordinator = StartCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
}
