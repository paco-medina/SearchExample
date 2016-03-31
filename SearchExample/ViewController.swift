//
//  ViewController.swift
//  SearchExample
//
//  Created by Francisco Medina on 3/30/16.
//  Copyright © 2016 Francisco Medina. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    var searchController : UISearchController!
    var searchBarDelegate : FMSearchBarDelegate!
    let searchResultsController = FMSearchResultsVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
    }

    // MARK: - Search controller
    private func setupSearchController() {
        // Setup the Search Controller
        searchBarDelegate = FMSearchBarDelegate(presenterView: view)
        searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchResultsUpdater = searchResultsController
        searchBarDelegate.searchBar = searchController.searchBar
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        self.navigationItem.titleView = searchController.searchBar
        searchController.hidesNavigationBarDuringPresentation = false
    }
    
}

