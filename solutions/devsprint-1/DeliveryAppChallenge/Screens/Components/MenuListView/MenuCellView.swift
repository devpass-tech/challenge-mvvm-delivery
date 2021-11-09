//
//  MenuCellView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class MenuCellView: UITableViewCell {

   private var mainStackView: UIStackView = {
       let stack = UIStackView(frame: .zero)
       stack.translatesAutoresizingMaskIntoConstraints = false
       stack.spacing = 16
       stack.alignment = .center
       return stack
    }()

    private var labelsStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "pizza")
        return imageView
    }()

    lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "Copo Pão de Queijo + Suco de Laranja"
        label.textAlignment = .left
        return label
    }()

    lazy var itemPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "R$ 20,00"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator

        addSubviews()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuCellView {

    func addSubviews() {

        addSubview(mainStackView)
        mainStackView.addArrangedSubview(labelsStackView)
        mainStackView.addArrangedSubview(itemImageView)

        labelsStackView.addArrangedSubview(itemNameLabel)
        labelsStackView.addArrangedSubview(itemPriceLabel)
    }

    func configureConstraints() {

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            itemImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            itemImageView.widthAnchor.constraint(equalToConstant: 64),
            itemImageView.heightAnchor.constraint(equalToConstant: 64),

            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)

        ])
    }
}
