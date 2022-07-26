//
//  AddressSearchViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class AddressSearchViewController: UIViewController {

    let searchController = UISearchController(searchResultsController: nil)

    init() {
        super.init(nibName: nil, bundle: nil)

        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Rua, número, bairro"
        searchController.searchBar.delegate = self

        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.title = "Address Search"
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = AddressListView()
    }
}

extension AddressSearchViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {

    }
}

extension AddressSearchViewController: UISearchBarDelegate, UISearchControllerDelegate {

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {

    }
}
