//
//  SearchBarView.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import UIKit

protocol SearchBarViewDelegate {
    func navigateToResults(searchText: String)
    func removeRightBarButtonItem()
    func addRightBarButtonItem()
}

class SearchBarView: UIView {
    var delegate: SearchBarViewDelegate?

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = String.placeHolder
        searchBar.delegate = self
        searchBar.autocorrectionType = .no
        searchBar.keyboardType = .webSearch
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .default
        searchBar.tintColor = .darkGray
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.textColor = .darkGray
        searchBar.searchTextField.leftView?.tintColor = .lightGray
        searchBar.backgroundColor = .meliYellow
        searchBar.searchTextField.backgroundColor = .white
        return searchBar
    }()

    lazy var rightButton: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: String.buttonImage), for: .normal)
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        let buttonItem = UIBarButtonItem(customView: button)
        return buttonItem
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white

        applyAditionalStyleSearchBar()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if searchBar.isFirstResponder {
            stopSearch()
        }
    }

    @objc func rightButtonTapped() {
        print("RightButtonTapped")
    }

    private func applyAditionalStyleSearchBar() {
        aditionalAppearanceSearchBar()
        placeholderStyle()
    }

    private func placeholderStyle() {
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.lightGray
            ]
            let attributedPlaceholder = NSAttributedString(
                string: String.placeHolder,
                attributes: placeholderAttributes
            )
            textField.attributedPlaceholder = attributedPlaceholder
        }
    }

    private func aditionalAppearanceSearchBar() {
        if let clearButton = searchBar.searchTextField.value(forKey: "clearButton") as? UIButton {
            let templateImage = UIImage(systemName: "xmark.circle.fill")
            templateImage?.withRenderingMode(.alwaysTemplate)
            clearButton.setImage(templateImage, for: .normal)
            clearButton.tintColor = .gray
        }
    }
}

fileprivate extension String {
    static let placeHolder = "Buscar en Mercado Libre"
    static let buttonImage = "cart"
}
