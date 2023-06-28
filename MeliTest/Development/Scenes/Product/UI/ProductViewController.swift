//
//  ProductViewController.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import UIKit

class ProductViewController: BaseViewController {
    private var coordinator: ProductCoordinator?
    var viewModel: ProductViewModel?
    var productView: ProductView?
    var productId: String

    init(viewModel: ProductViewModel?,
         coordinator: ProductCoordinator?,
         productId: String) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        self.productId = productId
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.updateView = { [weak self] in
            guard let self else { return }
            self.setUpView()
        }

        viewModel?.showError = { [weak self] (serviceError: ServiceError) in
            guard let self else { return }
            self.showError(error: serviceError)
        }

        viewModel?.initModule(idProduct: productId)
    }

    func setUpView() {
        guard let model = viewModel else { return }
        productView = ProductView(pictures: model.pictures,
                                  titleText: model.title,
                                  priceText: model.price,
                                  descriptionText: model.descriptionProduct)

        guard let productView else { return }
        view.addSubview(productView)
        productView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            productView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            productView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
}
