//
//  TeslaDetailViewController.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 10.03.2022.
//

import UIKit

class TeslaDetailViewController: UIViewController {
  
  var coordinator: DetailViewDismissFlow?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Properties
  
  var teslaModel: TeslaModel? {
      didSet {
        
        configureItem(model: teslaModel!)
        
      }
  }
  
  // MARK: - Actions
  @objc func dismissDetailTapped(_ sender: UIButton) {
      coordinator?.dismissDetail()
  }

  let modelLabel: UILabel = {
      let label = UILabel()
      label.textColor = .systemIndigo
      return label
  }()
  
  private let teslaImageView: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
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
      return button
  }()

  
  func configureItem(model: TeslaModel) {
    self.modelLabel.text = model.teslaModel
    self.teslaImageView.image = UIImage(named: "\(model.teslaImage)")
  }
  
}


// MARK: - UI Setup
extension TeslaDetailViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.view.backgroundColor = .white
        self.view.addSubview(modelLabel)
        self.view.addSubview(teslaImageView)
        self.view.addSubview(dismissDetailButton)
      
      modelLabel.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.top.equalToSuperview().offset(10)
      }
      
      teslaImageView.snp.makeConstraints { make in
        
        make.centerY.centerX.equalToSuperview()
        make.width.height.equalTo(400)
      }
      
      dismissDetailButton.snp.makeConstraints { make in
        
        make.bottom.equalToSuperview().offset(-15)
        make.centerX.equalToSuperview()
        make.height.equalTo(30)
        make.width.equalTo(UIScreen.main.bounds.width / 3)
       
      }
    }
}


