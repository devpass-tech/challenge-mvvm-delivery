//
//  CategoryCellView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

protocol CategoryCellViewProtocolDelegate: AnyObject {
    func imageTapped()
}

class CategoryCellView: UIView {
 
    private weak var delegate: CategoryCellViewProtocolDelegate?
    
    func configDelegate(delegate: CategoryCellViewProtocolDelegate?) {
        self.delegate = delegate
    }
    
    let stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()

    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pizza")
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()

    let nameLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pizza"
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()

    init() {
        super.init(frame: .zero)
        addSubviews()
        configureConstraints()
        configImageView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configImageView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        self.delegate?.imageTapped()
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 54, height: 70)
    }
}

extension CategoryCellView {

    func addSubviews() {

        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
    }

    func configureConstraints() {

        NSLayoutConstraint.activate([

            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),

            imageView.heightAnchor.constraint(equalToConstant: 54),
            imageView.widthAnchor.constraint(equalToConstant: 54)
        ])
    }
}


