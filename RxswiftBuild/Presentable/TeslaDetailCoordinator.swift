//
//  TeslaDetailCoordinator.swift
//  RxswiftBuild
//
//  Created by Tony-Eniola  on 10.03.2022.
//

import UIKit

protocol DetailViewDismissFlow {
    func dismissDetail()
}

class TeslaDetailCoordinator: Coordinator, DetailViewDismissFlow {
  let navigationController: UINavigationController
  let teslaModel: String
  init(navigationController: UINavigationController, teslaModel: String) {
      self.navigationController = navigationController
      self.teslaModel = teslaModel
  }
  
  func start() {
    let teslaDetailViewController = TeslaDetailViewController()
    teslaDetailViewController.coordinator = self
    teslaDetailViewController.TeslaModel = teslaModel
    navigationController.present(teslaDetailViewController, animated: true, completion: nil)
  }

  
  // MARK: - Flow Methods
  func dismissDetail() {
      navigationController.dismiss(animated: true, completion: nil)
  }


}
