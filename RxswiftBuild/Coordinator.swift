//
//  Coordinator.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 09.03.2022.
//


import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    
    var navigationController: UINavigationController? { get set}
    
    func eventOccurred(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
    
}
