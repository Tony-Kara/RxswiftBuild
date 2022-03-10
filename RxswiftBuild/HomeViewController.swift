//
//  ViewController.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 09.03.2022.


import UIKit

class HomeViewController: UIViewController {
 
  var coordinator: StartFlow?

  let fbView = FbView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view = fbView
        fbView.delegate = self
    }


}
  
extension HomeViewController: FbViewDelegate {
  func view(_ view: FbView, didTouchUpInside button: UIButton) {
    coordinator?.coordinateToTabBar()
  }
  
}

