//
//  SecondViewController.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 09.03.2022.
//

import UIKit
import RxSwift
import RxCocoa

class TeslaListViewController: UIViewController{

  
  
  let searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.placeholder = " Search..."
    searchBar.sizeToFit()
    searchBar.isTranslucent = true
    searchBar.backgroundColor = .white
    searchBar.backgroundImage = UIImage()
    return searchBar
  }()
  
  private  let tableview: UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
    table.backgroundColor = .white
    table.rowHeight = 100
    table.register(TeslaModelsTableViewCell.self, forCellReuseIdentifier: "cell")
    return table
  }()
  
   override func viewDidLoad() {
       super.viewDidLoad()
       // Do any additional setup after loading the view.
       view.backgroundColor = .clear
       bindView()
       setUpView()
   }
  // MARK: - Properties
  var coordinator: DetailViewFlow?
  var viewModel = TeslaViewModel()
  let bag = DisposeBag()

  private func bindView(){
    
    
  searchBar.rx.text.orEmpty
      .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
      .distinctUntilChanged()
      .map {
        query in
        self.viewModel.testlaModels.value.filter { teslamodel in
          
          query.isEmpty || teslamodel.teslaModel.lowercased().contains(query.lowercased())
        }
      }
      .bind(to: tableview.rx.items(cellIdentifier: "cell", cellType: TeslaModelsTableViewCell.self)) {
        _, model, cell in
        
        cell.set(model: model)
        
      }
      .disposed(by: bag)
    

    tableview.rx.modelSelected(TeslaModel.self)
      .subscribe(onNext: { model in
        self.coordinator?.coordinateToDetail(with: model)
      }
      
      )
      .disposed(by: bag)

  }
  
  func setUpView(){
    view.addSubview(tableview)
    view.addSubview(searchBar)
    tableview.snp.makeConstraints { make in
      make.top.equalTo(searchBar.snp.bottom)
      make.leading.trailing.bottom.equalToSuperview()
    
    }
    
    searchBar.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      make.leading.trailing.equalToSuperview()
     // make.height.equalTo(30)
      
    }
    
  }
}



