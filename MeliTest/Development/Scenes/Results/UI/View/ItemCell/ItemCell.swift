//
//  ItemCell.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import Foundation
import UIKit

class ItemCell: UITableViewCell {
    static var identifier: String = "ItemCellIdentifier"
    var image: String?
    var title: String?
    var price: Double?

    lazy var itemImage: UIImageView = {
        let image = UIImageView()
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        image.backgroundColor = .clear
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var titleLabel: UILabel = {
        let value = UILabel()
        value.textColor = .black
        value.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        value.lineBreakMode = .byWordWrapping
        value.translatesAutoresizingMaskIntoConstraints = false
        value.numberOfLines = 0
        return value
    }()

    lazy var priceLabel: UILabel = {
        let value = UILabel()
        value.font = UIFont.boldSystemFont(ofSize: 20)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.numberOfLines = 0
        value.textColor = .black
        return value
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        contentView.addSubview(itemImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        applyConstraints()
    }

    // MARK: Aditional Functions
    func setImage(_ image: String?) {
        guard let image else { return }
        itemImage.downloadImageFromUrl(from: image)
    }

    func setTitle(_ title: String?) {
        guard let title else { return }
        titleLabel.text = title
    }

    func setPrice(_ price: Double?) {
        guard let price else { return }
        priceLabel.text = NumberFormatter().formatCurrency(value: price)
    }
}
