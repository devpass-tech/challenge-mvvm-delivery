//
//  AddressSearchViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class AddressSearchViewController: UIViewController {

    let searchController = UISearchController(searchResultsController: nil)
    
    private let viewModel = AddressSearchViewModel()
    
    private lazy var addressListView: AddressListView = {
        let addressListView = AddressListView(dataSource: self)
        return addressListView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)

        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Rua, número, bairro"
        searchController.searchBar.delegate = self
        
        viewModel.delegate = self

        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.title = "Address Search"
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        viewModel.fetchAddresses()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = addressListView
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

extension AddressSearchViewController: AddressSearchViewModelDelegate {
    func didLoadAddresses() {
        addressListView.updateAddressListView()
    }
    
    func didFailLoadAddresses(error: String) { }
}

extension AddressSearchViewController: AddressListDataSource {
    var count: Int {
        viewModel.count
    }
    
    func getAddressViewModel(at indexPath: IndexPath) -> AddressCellViewModel {
        viewModel.getAddress(at: indexPath)
    }
}
