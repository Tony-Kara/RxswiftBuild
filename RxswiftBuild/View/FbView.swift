//
//  FbView.swift
//  RxswiftBuild
//
//  Created by User on 09.03.2022.
//

import UIKit
import SnapKit


protocol FbViewDelegate: AnyObject {
    func view(_ view: FbView, didTouchUpInside button: UIButton)
}

class FbView: UIView {
  
  var coordinator: Coordinator?
  weak var delegate: FbViewDelegate?
  var contentView:UIView = UIView()
  var background:UIImageView = UIImageView()
  
  private lazy var fbButton: UIButton = {
      let button = UIButton(type: .system)
      button.setTitle("Tap Me!!", for: .normal)
      button.backgroundColor = .systemGreen
      button.setTitleColor(.black, for: .normal)
      button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
      return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func configureView(){
      addSubview(contentView)
      contentView.addSubview(background)
      contentView.addSubview(fbButton)
    
    contentView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    fbButton.snp.makeConstraints { make in
      make.leading.equalTo(contentView.snp.leading).offset(50)
      make.trailing.equalTo(contentView.snp.trailing).offset(-50)
      make.centerX.equalTo(contentView.snp.centerX)
      make.centerY.equalTo(contentView.snp.centerY)
   
    }
    
    background.image = UIImage(named: "Background")
    background.snp.makeConstraints { make in
      make.leading.equalTo(contentView.snp.leading)
      make.trailing.equalTo(contentView.snp.trailing)
      make.top.equalTo(contentView.snp.top)
      make.bottom.equalTo(contentView.snp.bottom)
   
    }
    
  }
  
      @objc func didTapButton() {
         // coordinator?.eventOccurred(with: .buttonTapped)
        delegate?.view(self, didTouchUpInside: fbButton)
      }
  
}
