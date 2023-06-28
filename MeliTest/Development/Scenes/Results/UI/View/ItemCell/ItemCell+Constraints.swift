//
//  ItemCell+Constraints.swift
//  MeliTest
//
//  Created by LuisR on 25/06/2023.
//

import UIKit

extension ItemCell {
    func applyConstraints() {
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            itemImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            itemImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            itemImage.widthAnchor.constraint(equalToConstant: 120),

            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),

            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            priceLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 16),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
