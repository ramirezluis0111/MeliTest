//
//  ProductCoordinator.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import UIKit

class ProductCoordinator: Coordinator {
    let navigationController: UINavigationController
    var productId: String?

    init(navigationController: UINavigationController,
         product: String?) {
        self.navigationController = navigationController
        self.productId = product
    }

    func start() {
        let productViewModel = ProductViewModel()
        guard let productId else { return }
        let productViewController = ProductViewController(viewModel: productViewModel,
                                                          coordinator: self,
                                                          productId: productId)
        navigationController.pushViewController(productViewController, animated: true)
    }
}
