//
//  SearchViewController.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import UIKit

class SearchBarViewController: BaseViewController {
    private var searchBar: UISearchBar?
    private var viewModel: SearchViewModel?
    var rightButton: UIBarButtonItem?
    var delegate: HomeViewModelCoordinatorDelegate?

    init(viewModel: SearchViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .meliYellow
        setUpView()
    }

    func setUpView() {
        let searchView = SearchBarView()
        searchView.delegate = self
        view = searchView
        searchBar = searchView.searchBar
        rightButton = searchView.rightButton
        navigationItem.titleView = searchView.searchBar
        navigationItem.rightBarButtonItem = searchView.rightButton
        navigationController?.toolbar.backgroundColor = .meliYellow
        navigationController?.navigationBar.isTranslucent = false
    }
}
