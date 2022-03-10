//
//  Coordinator.swift
//  RxswiftBuild
//
//  Created by Tony Eniola on 09.03.2022.
//


import UIKit

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}

