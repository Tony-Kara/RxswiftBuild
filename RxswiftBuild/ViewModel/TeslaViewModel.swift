//
//  TeslaViewModel.swift
//  RxswiftBuild
//
//  Created by User on 10.03.2022.
//

import UIKit
import RxSwift
import RxCocoa

final class TeslaViewModel {
  
//  let testlaModels = BehaviorRelay(value: [
//
//    TeslaModel(teslaModel:  "Model S", teslaImage: "teslaX"),
//    TeslaModel(teslaModel:  "Model X", teslaImage: "teslaY"),
//    TeslaModel(teslaModel:  "Model Y", teslaImage: "teslaS"),
//    TeslaModel(teslaModel:  "Model 3", teslaImage: "tesla3"),
//    TeslaModel(teslaModel:  "Model S P90", teslaImage: "teslaXP90")
//
//  ])
  
  let tableViewItemsSelected = BehaviorRelay(value: [
  
    SectionModel(header: "Tesla First Generation", items: [
    
      TeslaModel(teslaModel:  "Model S", teslaImage: "teslaX"),
      TeslaModel(teslaModel:  "Model X", teslaImage: "teslaY")
      
    ]),
    SectionModel(header: "Tesla Second Generation", items: [
      TeslaModel(teslaModel:  "Model Y", teslaImage: "teslaS"),
      TeslaModel(teslaModel:  "Model 3", teslaImage: "tesla3")
    ]),
    SectionModel(header: "Tesla Third Generation", items: [
      TeslaModel(teslaModel:  "Model S P90", teslaImage: "teslaXP90")
    ])
  
  ])
}
