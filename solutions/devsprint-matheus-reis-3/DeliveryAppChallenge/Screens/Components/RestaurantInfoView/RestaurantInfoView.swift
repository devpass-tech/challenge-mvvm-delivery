//
//  RestaurantInfoView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class RestaurantInfoView: UIView {
    
    private var mainStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 16
        stack.alignment = .center
        stack.backgroundColor = .white
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()

    private var labelsStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "restaurant-logo")
        return imageView
    }()

    lazy var restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()

    lazy var restaurantInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
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
        return CGSize(width: UIView.noIntrinsicMetric, height: 100)
    }

    public func updateView(name: String, content: String){
        restaurantInfoLabel.text = content
        restaurantNameLabel.text = name
    }
}

extension RestaurantInfoView {

    func addSubviews() {

        addSubview(mainStackView)
        mainStackView.addArrangedSubview(labelsStackView)
        mainStackView.addArrangedSubview(logoImageView)

        labelsStackView.addArrangedSubview(restaurantNameLabel)
        labelsStackView.addArrangedSubview(restaurantInfoLabel)
    }

    func configureConstraints() {

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            self.logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 50),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
}

