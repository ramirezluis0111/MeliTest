//
//  ResultCoordinator+Protocol.swift
//  MeliTest
//
//  Created by LuisR on 25/06/2023.
//

extension ResultsCoordinator: ResultsCoordinatorProtocol {
    func didSelectMenuCell(model: ItemModel) {
        let productCoordinator = ProductCoordinator(navigationController: navigationController,
                                                    product: model.id)
        productCoordinator.start()
    }
}
