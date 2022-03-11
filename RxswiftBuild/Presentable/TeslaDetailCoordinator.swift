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
  let teslaModel: TeslaModel
  init(navigationController: UINavigationController, teslaModel: TeslaModel) {
      self.navigationController = navigationController
      self.teslaModel = teslaModel
  }
  
  func start() {
    let teslaDetailViewController = TeslaDetailViewController()
    teslaDetailViewController.coordinator = self
    teslaDetailViewController.teslaModel = teslaModel
    navigationController.present(teslaDetailViewController, animated: true, completion: nil)
  }

  
  // MARK: - Flow Methods
  func dismissDetail() {
      navigationController.dismiss(animated: true, completion: nil)
  }


}
