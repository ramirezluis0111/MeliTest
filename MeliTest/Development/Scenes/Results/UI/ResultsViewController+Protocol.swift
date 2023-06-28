//
//  ResultsViewController+Protocol.swift
//  MeliTest
//
//  Created by LuisR on 25/06/2023.
//

extension ResultsViewController: ResultsViewProtocol {
    func didSelectMenuCell(model: ItemModel) {
        delegate?.didSelectMenuCell(model: model)
    }

    func loadMoreData() {
        viewModel?.loadMoreData()
    }
}
