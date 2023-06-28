//
//  CarouselView.swift
//  MeliTest
//
//  Created by LuisR on 25/06/2023.
//

import UIKit

class CarouselView: UIView {
    var listImage: [Picture]?
    var position: Int = 0

    var productImage: UIImage? {
        didSet {
            imageView.image = productImage
        }
    }

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.downloadImageFromUrl(from: listImage?.first?.url ?? "")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var countPage: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(listImage: [Picture]?) {
        self.listImage = listImage
        super.init(frame: CGRect.zero)
        backgroundColor = .white

        setUpView()
        addGestureView()
        configInitialPositionLabel()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpView() {
        addSubview(imageView)
        addSubview(countPage)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),

            countPage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            countPage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            countPage.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    func configInitialPositionLabel() {
        countPage.text = " \(position + 1) / \(listImage?.count ?? 0) "
    }

    func updateImage(url: String?) {
        guard let url else { return }
        imageView.downloadImageFromUrl(from: url)
    }

    func addGestureView() {
        let leftSwipeGesturePage = UISwipeGestureRecognizer(target: self, action: #selector(addGestures(_:)))
        leftSwipeGesturePage.direction = .left
        self.addGestureRecognizer(leftSwipeGesturePage)

        let rightSwipeGesturePage = UISwipeGestureRecognizer(target: self, action: #selector(addGestures(_:)))
        rightSwipeGesturePage.direction = .right
        self.addGestureRecognizer(rightSwipeGesturePage)
    }

    func updatePosition(isLeft: Bool) {
        var pos = position
        pos += isLeft ? 1 : -1

        if 0..<(listImage?.count ?? 0) ~= pos {
            position = pos
            countPage.text = " \(position + 1) / \(listImage?.count ?? 0) "
            updateImage(url: listImage?[pos].url)
        }
    }

    @objc private func addGestures(_ gesture: UISwipeGestureRecognizer) {
        gesture.direction == .left ? updatePosition(isLeft: true)
                                   : updatePosition(isLeft: false)
    }

}
