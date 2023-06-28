//
//  ResultsViewModel.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import UIKit

class ResultsViewModel {
    private var meliServices: MeliServices?
    var visibleRange: Range<Int> = 0..<0

    var allDataFromApi: ResultsItemsModel? {
        didSet {
            handleResultsItemsResponse(allDataFromApi)
        }
    }

    var allData: [ItemModel] = [] {
        didSet {
            visibleData = allData
        }
    }

    var visibleData: [ItemModel] = [] {
        didSet {
            updateView?()
        }
    }

    var updateView: (() -> Void)?
    var reloadTable: (() -> Void)?
    var showError: ((ServiceError) -> Void)?

    init(meliServices: MeliServices? = MeliServices()) {
        self.meliServices = meliServices
    }

    func resultsItems(resultsText: String) {
        meliServices?.getMeliRequest(
            itemSearch: resultsText,
            requestType: .SearchItems,
            onSuccess: { [weak self] response, _ in
                guard let self else { return }
                self.allDataFromApi = response
            }, onFailure: { [weak self] _, error in
                guard let self,
                      let error else { return }
                self.showError?(error)
            }
        )
    }

    func handleResultsItemsResponse(_ resultsItems: ResultsItemsModel?) {
        guard let itemModels = resultsItems?.results else {
            self.showError?(.systemError)
            return
        }

        allData = itemModels
    }

    func loadMoreData() {
        let pageSize = 50
        let upperBound = min(visibleRange.upperBound + pageSize,
                             allData.count)
        let newRange = visibleRange.lowerBound..<upperBound
        visibleData += allData[newRange]
        visibleRange = newRange
    }
}
