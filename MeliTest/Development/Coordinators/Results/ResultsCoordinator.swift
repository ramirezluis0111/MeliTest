//
//  ResultsCoordinator.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import UIKit

class ResultsCoordinator: Coordinator {
    let navigationController: UINavigationController
    var searchText: String?

    init(navigationController: UINavigationController,
         searchText: String?) {
        self.navigationController = navigationController
        self.searchText = searchText
    }

    func start() {
        let resultsViewModel = ResultsViewModel()
        let resultsViewController = ResultsViewController(viewModel: resultsViewModel,
                                                          resultsText: searchText)
        resultsViewController.delegate = self
        navigationController.pushViewController(resultsViewController, animated: true)
    }
}
