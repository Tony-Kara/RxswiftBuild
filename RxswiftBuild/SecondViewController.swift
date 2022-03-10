//
//  SecondViewController.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 09.03.2022.
//

import UIKit
import RxSwift
import RxCocoa

class SecondViewController: UIViewController, Coordinating {
  var coordinator: Coordinator?
  var viewModel = TeslaViewModel()
  let bag = DisposeBag()
  
  private  let tableview: UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
    table.backgroundColor = .white
    table.rowHeight = 40
    table.register(TeslaModelsTableViewCell.self, forCellReuseIdentifier: "cell")
    return table
  }()
   
 
   
   override func viewDidLoad() {
       super.viewDidLoad()
       // Do any additional setup after loading the view.
      
       bindView()
       setUpView()
   }

 

  private func bindView(){
    
    viewModel.testlaModels
      .bind(to: tableview.rx.items(cellIdentifier: "cell", cellType: TeslaModelsTableViewCell.self)) {
        _, model, cell in
        
        cell.set(model: model)
        
      }
      .disposed(by: bag)
    
      
    
  }
  
  func setUpView(){
    
    view.addSubview(tableview)
    tableview.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
  }
}



