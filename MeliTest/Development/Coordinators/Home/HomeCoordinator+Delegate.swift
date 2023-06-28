//
//  HomeCoordinator+Delegate.swift
//  MeliTest
//
//  Created by LuisR on 25/06/2023.
//

extension HomeCoordinator: HomeViewModelCoordinatorDelegate {
    func navigateToResults(searchText: String) {
        let resultCoordinator = ResultsCoordinator(navigationController: navigationController,
                                                   searchText: searchText)
        resultCoordinator.start()
    }
}
