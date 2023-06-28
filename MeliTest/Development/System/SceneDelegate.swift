//
//  SceneDelegate.swift
//  MeliTest
//
//  Created by LuisR on 21/06/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navigationController: UINavigationController?
    var appCoordinator: Coordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        navigationController = UINavigationController()

        guard let navigationController else { return }

        applyStyle()
        buildWindow(scene)

        appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator?.start()
    }

    func applyStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .meliYellow

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        window?.tintColor = .meliYellow
    }

    func buildWindow(_ scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

