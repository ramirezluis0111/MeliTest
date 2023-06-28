//
//  SearchBar+Delegate.swift
//  MeliTest
//
//  Created by LuisR on 25/06/2023.
//

extension SearchBarViewController: SearchBarViewDelegate {
    func removeRightBarButtonItem() {
        navigationItem.rightBarButtonItem = nil
    }

    func addRightBarButtonItem() {
        navigationItem.rightBarButtonItem = rightButton
    }

    func navigateToResults(searchText: String) {
        delegate?.navigateToResults(searchText: searchText)
    }
}
