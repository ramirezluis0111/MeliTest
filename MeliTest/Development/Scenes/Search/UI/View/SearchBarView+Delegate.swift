//
//  SearchBarView+Delegate.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import UIKit

extension SearchBarView: UISearchBarDelegate  {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchTerm = searchBar.text {
            delegate?.navigateToResults(searchText: searchTerm)
            searchBar.text = ""
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.text = searchText.lowercased()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        delegate?.removeRightBarButtonItem()
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        delegate?.addRightBarButtonItem()
        stopSearch()
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        stopSearch()
    }

    func stopSearch() {
        delegate?.addRightBarButtonItem()
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}
