//
//  BindingSearchBar.swift
//  Bop
//
//  Created by Hoff Henry Pereira da Silva on 21/02/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//
import UIKit
import Foundation

class BindingSearchBar: UISearchBar {
    
    var textChanged: (String) -> () = { _ in }
    
    func bind(callback: @escaping(String) -> ())  {
        self.textChanged = callback
        self.target(forAction: #selector(searchBar), withSender: self)
    }
    
    @objc func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        textChanged(searchText)
    }
}
