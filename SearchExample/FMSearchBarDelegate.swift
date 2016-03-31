//
//  FMSearchBarDelegate.swift
//  SearchExample
//
//  Created by Francisco Medina on 3/30/16.
//  Copyright © 2016 Francisco Medina. All rights reserved.
//

import UIKit

class FMSearchBarDelegate: NSObject, UISearchBarDelegate {
    
    var searchPresenterView : UIView!
    var searchBar : UISearchBar!{
        didSet{
            searchBar.delegate = self
        }
    }
    
    lazy var trendingView : UIView = {
        let trending = UIView(frame: self.searchPresenterView.frame)
        trending.backgroundColor = UIColor.purpleColor()
        let button = UIButton()
        button.setTitle("Trending", forState: .Normal)
        button.addTarget(self, action: "searchTrending:", forControlEvents: UIControlEvents.TouchUpInside)
        button.backgroundColor = UIColor.redColor()
        button.translatesAutoresizingMaskIntoConstraints = false
        trending.addSubview(button)
    
        let xConstraint = button.centerXAnchor.constraintEqualToAnchor(trending.centerXAnchor)
        let yConstraint = button.centerYAnchor.constraintEqualToAnchor(trending.centerYAnchor)
        trending.addConstraints([xConstraint, yConstraint])
        xConstraint.active = true
        yConstraint.active = true
        return trending
    }()
    
    init(presenterView: UIView){
        super.init()
        searchPresenterView = presenterView
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        print("cancel search")
        trendingView.removeFromSuperview()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        print("start search")
        addTrendingView()
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        print("should begin editing")
        addTrendingView()
        return true
    }
    
    func searchTrending(sender:UIButton!){
        print("search trending")
        searchBar.text = sender.titleLabel?.text
    }
    
    private func addTrendingView(){
        searchPresenterView.addSubview(trendingView)
        searchPresenterView.bringSubviewToFront(trendingView)
    }
}
