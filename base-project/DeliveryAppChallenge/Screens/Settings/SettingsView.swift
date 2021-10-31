//
//  SettingsView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

private enum Sections: Int, CaseIterable {
    case name
    case email
    case address
    case paymentMethod

    var name: String {
        switch self {
        case .name:
            return "Name"
        case .email:
            return "Email"
        case .address:
            return "Address"
        case .paymentMethod:
            return "Payment Method"
        }
    }
}

class SettingsView: UIView {

    let cellIdentifier = "SettingsCell"

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGroupedBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        return tableView
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

        backgroundColor = .white
        
        addSubviews()
        configureConstraints()

        tableView.reloadData()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension SettingsView {

    func addSubviews() {

        addSubview(tableView)
    }

    func configureConstraints() {

        NSLayoutConstraint.activate([

            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension SettingsView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        guard let sectionIndex = Sections(rawValue: indexPath.section)
        else { return UITableViewCell() }

        switch sectionIndex {
        case .name:
            cell.textLabel?.text = "John Appleseed"

        case .email:
            cell.textLabel?.text = "john@apple.com"

        case .address:
            cell.textLabel?.text = "Rua Bela Cintra, 495 - Consolação"

        case .paymentMethod:
            cell.textLabel?.text = "Cartão de Crédito"
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        guard let section = Sections(rawValue: section) else {

            return nil
        }
        return section.name
    }
}

