//
//  TeslaListCoordinator.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 10.03.2022.
//

import UIKit

protocol DetailViewFlow {
    func coordinateToDetail(with title: String)
}

class TeslaListCoordinator: Coordinator, DetailViewFlow {
 
  
  weak var navigationController: UINavigationController?
  
  init(navigationController: UINavigationController) {
      self.navigationController = navigationController
  }
  
  func start() {
    let viewController = TeslaListViewController()
     viewController.coordinator = self
   // navigationController.present(viewController, animated: true, completion: nil)
    navigationController?.pushViewController(viewController, animated: false)
  }
  
  // MARK: - Flow Methods
  func coordinateToDetail(with title: String) {
    let teslaDetailCoordinator = TeslaDetailCoordinator(navigationController: navigationController!, teslaModel: title)
      
      coordinate(to: teslaDetailCoordinator)
  }
  
}


