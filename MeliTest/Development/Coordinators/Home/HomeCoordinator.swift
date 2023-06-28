//
//  HomeCoordinator.swift
//  MeliTest
//
//  Created by LuisR on 21/06/2023.
//

import UIKit

class HomeCoordinator: Coordinator {
    let navigationController: UINavigationController
    let mainCoordinator: AppCoordinator

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        mainCoordinator = AppCoordinator(navigationController: navigationController)
    }

    func start() {
        let homeViewModel = SearchViewModel()
        let homeViewController = SearchBarViewController(viewModel: homeViewModel)
        homeViewController.delegate = self
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
