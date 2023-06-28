//
//  ErrorView.swift
//  MeliTest
//
//  Created by LuisR on 26/06/2023.
//

import Lottie

class ErrorView: UIView {
    var errorLottieType: ErrorLottieType?

    lazy var animationView: AnimationView = {
        let starAnimationView = AnimationView(
            name: errorLottieType?.stringValue ?? ErrorLottieType.systemError.stringValue
        )
        starAnimationView.translatesAutoresizingMaskIntoConstraints = false
        starAnimationView.loopMode = .loop
        starAnimationView.play()
        return starAnimationView
    }()

    lazy var descriptionText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Ups! Ocurrio un inconveniente..\nReintenta en unos momentos."
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Intentar de nuevo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .systemOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    public var buttonAction: (() -> Void)?

    init(errorLottieType: ErrorLottieType?,
         buttonAction: (() -> Void)?) {
        self.errorLottieType = errorLottieType
        self.buttonAction = buttonAction
        super.init(frame: .zero)
        backgroundColor = .white
        applyConstraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func didTapButton() {
        buttonAction?()
        print("didTapButton")
    }

    func applyConstraint() {
        addSubview(animationView)
        addSubview(descriptionText)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            animationView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            animationView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            animationView.heightAnchor.constraint(equalToConstant: 250),

            descriptionText.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 40),
            descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                           constant: -16),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
