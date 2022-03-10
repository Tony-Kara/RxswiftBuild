//
//  SecondViewController.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 09.03.2022.
//

import UIKit

class SecondViewController: UIViewController, Coordinating {
  var coordinator: Coordinator?
  let label: UILabel = {
    let label = UILabel()
    label.text = "Test!!"
    label.textColor = .black
    return label
    
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .white
    title = "SecondViewController"
    view.addSubview(label)
    configureView()
  }

  func configureView() {
    label.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview()
    }
  }
  
  

}
