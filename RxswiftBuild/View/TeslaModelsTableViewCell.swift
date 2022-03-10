//
//  TeslaModelsTableViewCell.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 10.03.2022.
//

import UIKit

final class TeslaModelsTableViewCell: UITableViewCell {
  
  private let modelLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 13)
    return label
  }()
  
  private let teslaImageView: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: "cell")
    configureView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func configureView(){
    contentView.backgroundColor = .clear
    contentView.addSubview(modelLabel)
    contentView.addSubview(teslaImageView)
    
    
    modelLabel.snp.makeConstraints { make in
      make.leading.equalTo(teslaImageView.snp.trailing).offset(5)
      make.centerY.equalToSuperview()
    }
    
    teslaImageView.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(5)
      make.centerY.equalToSuperview()
      make.height.width.equalTo(70)
    }
    
    
  }
  
  func set(model: TeslaModel) {
    
    modelLabel.text = model.teslaModel
    teslaImageView.image = UIImage(named: model.teslaImage)
  }
  
}
