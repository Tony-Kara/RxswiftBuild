//
//  SecondViewController.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 09.03.2022.
//

import UIKit

class SecondViewController: UIViewController, Coordinating {
  var coordinator: Coordinator?
  
  private  let tableview: UITableView = {
       let table = UITableView(frame: .zero, style: .grouped)
       table.register(UITableViewCell.self, forCellReuseIdentifier: "tony")
       return table
   }()
   
   private let models = [
       "Model S",
       "Model X",
       "Model Y",
       "Model 3",
       "Model S P90"
   ]
   
   override func viewDidLoad() {
       super.viewDidLoad()
       // Do any additional setup after loading the view.
       view.addSubview(tableview)
       tableview.dataSource = self
   }

   override func viewDidLayoutSubviews() {
       super.viewDidLayoutSubviews()
       tableview.frame = view.bounds
   }

}

extension SecondViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
      return 2
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   return  models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "tony", for: indexPath)
      cell.textLabel?.text = models[indexPath.row]
      return cell
  }
  
}

