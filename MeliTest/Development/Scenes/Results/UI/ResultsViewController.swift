//
//  ResultsViewController.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import UIKit

class ResultsViewController: BaseViewController {
    var resultsText: String?
    var viewModel: ResultsViewModel?
    var resultsView: ResultsView?
    var delegate: ResultsCoordinatorProtocol?

    init(viewModel: ResultsViewModel?,
         resultsText: String?) {
        self.viewModel = viewModel
        self.resultsText = resultsText
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.updateView = { [weak self] in
            guard let self else { return }
            self.setUpView()
        }

        viewModel?.reloadTable = { [weak self] in
            guard let self else { return }
            self.reloadTable()
        }

        viewModel?.showError = { [weak self] (serviceError: ServiceError) in
            guard let self else { return }
            self.showError(error: serviceError)
        }

        viewModel?.resultsItems(resultsText: resultsText!)
    }

    func setUpView() {
        resultsView = ResultsView(visibleData: viewModel?.visibleData)
        resultsView?.delegate = self
        view = resultsView
    }

    func reloadTable() {
        resultsView?.visibleData = viewModel?.visibleData
    }
}
