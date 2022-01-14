//
//  MenuItemView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class MenuItemView: UIView {

    let scrollView: UIScrollView = {

        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()

    let imageView: UIImageView = {

        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pizza")
        return imageView
    }()

    let itemNameLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Copo Pão de Queijo + Suco de Laranja"
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()

    let itemDescriptionLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Combo com 8 mini pães de queijo + Suco de Laranja"
        label.numberOfLines = 5
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()

    let itemPriceLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 20,00"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()


    let addToCartButton: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Adicionar ao carrinho", for: .normal)
        return button
    }()

    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        addSubviews()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuItemView {

    func addSubviews() {

        addSubview(scrollView)
        scrollView.addSubview(stackView)

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(itemNameLabel)
        stackView.addArrangedSubview(itemDescriptionLabel)
        stackView.addArrangedSubview(itemPriceLabel)
        stackView.addArrangedSubview(addToCartButton)
    }

    func configureConstraints() {


        NSLayoutConstraint.activate([

            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            imageView.heightAnchor.constraint(equalToConstant: 250),

            itemNameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            itemNameLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),

            itemDescriptionLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            itemDescriptionLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),

            itemPriceLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            itemPriceLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),

        ])
    }
}
