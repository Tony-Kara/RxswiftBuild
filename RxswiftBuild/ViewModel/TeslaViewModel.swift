//
//  TeslaViewModel.swift
//  RxswiftBuild
//
//  Created by User on 10.03.2022.
//

import UIKit
import RxSwift

final class TeslaViewModel {
  
  let testlaModels = Observable.just([
    
    TeslaModel(teslaModel:  "Model S"),
    TeslaModel(teslaModel:  "Model X"),
    TeslaModel(teslaModel:  "Model Y"),
    TeslaModel(teslaModel:  "Model 3"),
    TeslaModel(teslaModel:  "Model S P90"),
    
  ])
  
}
