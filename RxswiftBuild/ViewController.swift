//
//  ViewController.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 09.03.2022.


import UIKit

class ViewController: UIViewController, Coordinating {
 
    var coordinator: Coordinator?

  let fbView = FbView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view = fbView
        fbView.delegate = self
    }


}
  
extension ViewController: FbViewDelegate {
  func view(_ view: FbView, didTouchUpInside button: UIButton) {
    coordinator?.eventOccurred(with: .buttonTapped)
  }
  
}

