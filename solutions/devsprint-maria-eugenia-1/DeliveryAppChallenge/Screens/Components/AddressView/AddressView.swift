//
//  AddressView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

class AddressView: UIView {

    let addressLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rua Guiratinga, 500"
        return label
    }()

    let editButton: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Editar", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    init() {
        super.init(frame: .zero)

        addSubviews()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 66)
    }
}

extension AddressView {

    func addSubviews() {

        addSubview(addressLabel)
        addSubview(editButton)
    }

    func configureConstraints() {

        NSLayoutConstraint.activate([

            addressLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            editButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            editButton.leadingAnchor.constraint(equalTo: addressLabel.trailingAnchor, constant: 16)
        ])
    }
}
