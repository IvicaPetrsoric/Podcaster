//
//  PodcastSearchController.swift
//  Podcaster
//
//  Created by Ivica Petrsoric on 12/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import UIKit

class PodcastSearchController: UITableViewController, UISearchBarDelegate{
    
    var podcasts = [Podcast]()
    var timer: Timer?
    let searchController = UISearchController(searchResultsController: nil)
    let cellId = "celld"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSearchBar()
        setupTableView()
        
//        searchBar(searchController.searchBar, textDidChange: "Fresh")
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    fileprivate func setupTableView() {
        let nib = UINib(nibName: "PodcastCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }

}
