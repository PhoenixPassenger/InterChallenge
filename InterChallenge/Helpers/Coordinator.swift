//
//  Coordinator.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 29/08/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
