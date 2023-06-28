//
//  ProductViewModel.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import Foundation

class ProductViewModel {
    var webService: MeliServices?
    var productID: String? {
        didSet {
            getInfoProduct(id: productID)
        }
    }

    var product: InfoProduct? {
        didSet {
            uploadView()
        }
    }

    var descriptionModel: Description? {
        didSet {
            uploadView()
        }
    }

    var pictures: [Picture]? {
        product?.pictures
    }

    var title: String? {
        product?.title
    }

    var price: Double? {
        product?.price
    }

    var descriptionProduct: String? {
        descriptionModel?.plainText
    }

    var updateView: (() -> Void)?
    var showError: ((ServiceError) -> Void)?

    init(webService: MeliServices? = MeliServices()) {
        self.webService = webService
    }

    func initModule(idProduct: String) {
        productID = idProduct
    }

    func getInfoProduct(id: String?) {
        searchItemInfo(id: productID)
        searchDescription(id: productID)
    }

    func uploadView() {
        if product != nil && descriptionModel != nil {
            updateView?()
        }
    }

    func searchItemInfo(id: String?) {
        guard let id else { return }

        webService?.getMeliRequest(
            itemSearch: id,
            requestType: .ItemInfo,
            onSuccess: { [weak self] response, _ in
                guard let self else { return }
                self.product = response
            }, onFailure: { [weak self] _, error in
                guard let self,
                      let error else { return }
                self.showError?(error)
            }
        )
    }

    func searchDescription(id: String?) {
        guard let id else { return }

        webService?.getMeliRequest(
            itemSearch: id,
            requestType: .DescriptionItem,
            onSuccess: { [weak self] response, _ in
                guard let self else { return }
                self.descriptionModel = response
            }, onFailure: { [weak self] _, error in
                guard let self,
                      let error else { return }
                self.showError?(error)
            }
        )
    }
}
