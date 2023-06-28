//
//  BaseViewController.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import UIKit

class BaseViewController: UIViewController {
    var hideNavBar = false {
        didSet {
            navigationItem.hidesBackButton = hideNavBar
            navigationController?.setNavigationBarHidden(hideNavBar, animated: false)
            if hideNavBar {
                navigationItem.leftBarButtonItems?.removeAll()
                navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .meliYellow
        navigationController?.navigationBar.tintColor = .meliYellow
        navigationController?.navigationBar.isTranslucent = false
        customBackArrow()
    }

    func customBackArrow() {
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        navigationController?.navigationBar.tintColor = .black
    }

    func showError(error: ServiceError) {
        let errorType = ErrorLottieType(error: error)
        let errorView = ErrorView(errorLottieType: errorType,
                                  buttonAction: popView)
        errorView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(errorView)

        NSLayoutConstraint.activate([
            errorView.topAnchor.constraint(equalTo: view.topAnchor),
            errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }

    func popView() {
        self.navigationController?.popViewController(animated: false)
    }
}
