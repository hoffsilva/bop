//
//  MoviesListViewModel.swift
//  Bop
//
//  Created by Hoff Henry Pereira da Silva on 18/02/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation
import Alamofire

protocol MoviesListDelegate: class {
    /// Called when request for Movies list has finished loading
    func didFinishLoading()
    
    /// Called if request for Movies list has failed
    ///
    /// - Parameter errorMessage: Message describing error
    func didFailLoading(with errorMessage: String, code errorCode: Int?)
}

class MoviesListViewModel {
    
    var searchParameter: Observable<String>!
    
    var arrayMovie: [Movie]?
    
    var arraySearchedMovie: [Movie]?
    
    var lastPage: Int!
    
    var numberOfMovies: Int {
        return arrayMovie?.count ?? 0
    }
    
    var numberOfSeachedMovies: Int {
        return arraySearchedMovie?.count ?? 0
    }
    
    
    func loadMovies() {
        Alamofire.request(ConstantsUtil.upcomigMoviesURL()).responseJSON { (response) in
            print(response)
            

            
        }
    }
    
    
}
