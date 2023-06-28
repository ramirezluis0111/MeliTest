//
//  ProductView+LayoutContraint.swift
//  MeliTest
//
//  Created by LuisR on 25/06/2023.
//

import UIKit

extension ProductView {
    func applyConstraint() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            titleLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            imageCarousel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            imageCarousel.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageCarousel.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageCarousel.heightAnchor.constraint(equalToConstant: 300),

            priceLabel.topAnchor.constraint(equalTo: imageCarousel.bottomAnchor, constant: 16),
            priceLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
}
