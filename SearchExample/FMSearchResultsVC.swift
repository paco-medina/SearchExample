//
//  FMSearchResultsVC.swift
//  SearchExample
//
//  Created by Francisco Medina on 3/30/16.
//  Copyright © 2016 Francisco Medina. All rights reserved.
//

import UIKit

class FMSearchResultsVC: UIViewController, UISearchResultsUpdating {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blueColor()
        // Do any additional setup after loading the view.
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        print("search results updating \(searchController.searchBar.text)")
    }
}
