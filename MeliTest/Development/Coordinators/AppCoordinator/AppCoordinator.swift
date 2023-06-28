//
//  AppCoordinator.swift
//  MeliTest
//
//  Created by LuisR on 21/06/2023.
//

import UIKit

class AppCoordinator: Coordinator {
    private let navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showHomeScreen()
    }

    func showHomeScreen() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator.start()
    }
}
