//
//  ResultsView.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import UIKit

class ResultsView: UIView {
    var delegate: ResultsViewProtocol?
    var visibleData: [ItemModel]? {
        didSet {
            tableView.reloadData()
        }
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isUserInteractionEnabled = true
        tableView.separatorColor = .gray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.backgroundView = nil
        tableView.register(ItemCell.self, forCellReuseIdentifier: ItemCell.identifier)
        return tableView
    }()

    init(visibleData: [ItemModel]?) {
        self.visibleData = visibleData
        super.init(frame: .zero)
        backgroundColor = .white
        setupTableView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTableView() {
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        // Borrar Test
//        let errorView = ErrorView()
//        errorView.translatesAutoresizingMaskIntoConstraints = false
//
//        addSubview(errorView)
//
//        NSLayoutConstraint.activate([
//            errorView.topAnchor.constraint(equalTo: topAnchor),
//            errorView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            errorView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            errorView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
        // Borrar Test
    }
}
