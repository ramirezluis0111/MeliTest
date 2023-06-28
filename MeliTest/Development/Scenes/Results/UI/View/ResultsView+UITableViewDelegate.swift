//
//  ResultsView+UITableViewDelegate.swift
//  MeliTest
//
//  Created by LuisR on 25/06/2023.
//

import UIKit

extension ResultsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 150 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        visibleData?.count ?? 0
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ItemCell.identifier,
            for: indexPath) as? ItemCell else {
            return UITableViewCell()
        }
        let itemCellModel = visibleData?[indexPath.row]
        cell.selectionStyle = .none
        cell.setImage(itemCellModel?.thumbnail)
        cell.setTitle(itemCellModel?.title)
        cell.setPrice(itemCellModel?.price)
        return cell
    }

    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        let lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
        if indexPath.row == lastRowIndex {
            delegate?.loadMoreData()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedModel = (visibleData?[indexPath.row]) else {
            return
        }
        delegate?.didSelectMenuCell(model: selectedModel)
    }
}
