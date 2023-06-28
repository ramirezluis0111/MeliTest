//
//  ProductView.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import UIKit

class ProductView: UIView {
    var pictures: [Picture]?
    var titleText: String?
    var priceText: Double?
    var buttonText: String? = "Comprar ahora"
    var descriptionText: String?

    lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.isScrollEnabled = true
        return scrollview
    }()

    lazy var imageCarousel: CarouselView = {
        let carousel = CarouselView(listImage: pictures)
        carousel.translatesAutoresizingMaskIntoConstraints = false
        return carousel
    }()

    lazy var titleLabel: UILabel = {
        let value = UILabel()
        value.textColor = .black
        value.text = titleText
        value.font = UIFont.systemFont(ofSize: 18, weight: .light)
        value.lineBreakMode = .byWordWrapping
        value.translatesAutoresizingMaskIntoConstraints = false
        value.numberOfLines = 0
        return value
    }()

    lazy var priceLabel: UILabel = {
        let value = UILabel()
        value.text = NumberFormatter().formatCurrency(value: priceText ?? 0)
        value.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.numberOfLines = 0
        value.textColor = .black
        return value
    }()

    lazy var descriptionLabel: UILabel = {
        let value = UILabel()
        value.text = descriptionText
        value.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.numberOfLines = 0
        value.textColor = .black
        return value
    }()

    // MARK: Initializers
    required init(pictures: [Picture]? = nil,
                  titleText: String?,
                  priceText: Double?,
                  buttonText: String? = "Comprar ahora",
                  descriptionText: String?) {
        self.pictures = pictures
        self.titleText = titleText
        self.priceText = priceText
        self.buttonText = buttonText
        self.descriptionText = descriptionText
        super.init(frame: .zero)
        backgroundColor = .white
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Layout
    private func setupLayout() {
        addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(imageCarousel)
        scrollView.addSubview(priceLabel)
        scrollView.addSubview(descriptionLabel)

        applyConstraint()
    }
}
