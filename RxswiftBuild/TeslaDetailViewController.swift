//
//  TeslaDetailViewController.swift
//  RxswiftBuild
//
//  Created by User on 10.03.2022.
//

import UIKit

class TeslaDetailViewController: UIViewController {
  
  var coordinator: DetailViewDismissFlow?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Properties

  var TeslaModel: String? {
      didSet {
        
        self.modelLabel.text = TeslaModel
        
      }
  }
  
  // MARK: - Actions
  @objc func dismissDetailTapped(_ sender: UIButton) {
      coordinator?.dismissDetail()
  }

  let modelLabel: UILabel = {
      let label = UILabel()
      label.textColor = .systemIndigo
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
  }()
  
  let dismissDetailButton: UIButton = {
      let button = UIButton()
      button.setTitle("Dismiss detail", for: .normal)
      button.setTitleColor(.white, for: .normal)
      button.backgroundColor = UIColor.systemGray
      button.layer.cornerRadius = 10
      button.layer.shadowRadius = 5
      button.layer.shadowColor = UIColor.gray.cgColor
      button.layer.shadowOpacity = 1.0
      button.layer.shadowOffset = CGSize(width: -1, height: 3)
      button.addTarget(self, action: #selector(dismissDetailTapped), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
  }()

  
}


// MARK: - UI Setup
extension TeslaDetailViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.view.backgroundColor = .white
        self.view.addSubview(modelLabel)
        self.view.addSubview(dismissDetailButton)
        
        NSLayoutConstraint.activate([
          modelLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
          modelLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            
            dismissDetailButton.widthAnchor
                .constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            dismissDetailButton.heightAnchor
                .constraint(equalToConstant: 50),
            dismissDetailButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            dismissDetailButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}


