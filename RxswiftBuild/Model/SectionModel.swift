//
//  SectionModel.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 27.03.2022.
//

import Foundation
import RxDataSources

struct SectionModel {
  var header:String
  var items: [TeslaModel]
}

extension SectionModel : SectionModelType {
  init(original: SectionModel, items: [TeslaModel]) {
    self = original
    self.items = items
  }
  
  
}
