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
    
    weak var delegate: MoviesListDelegate?
    
    var searchParameter = ""
    
    var currentMovie: Int!
    
    var isSearchingMovies = false
    
    var arrayMovie = [Movie]()
    
    var lastPage: Int!
    
    var numberOfMovies: Int {
        return arrayMovie.count 
    }
    
    
    func loadMovies() {
        if isSearchingMovies {
            ServiceConnection.fetchData(endPointURL: ConstantsUtil.searchMoviesURL(searchParameter), responseJSON: { (response) in
                self.serviceTask(response: response)
            })
        } else {
            ServiceConnection.fetchData(endPointURL: ConstantsUtil.upcomigMoviesURL(), responseJSON: { (response) in
                self.serviceTask(response: response)
            })
        }
    }
    
    func serviceTask(response : DataResponse<Any>) {
        
        if response.result.value != nil {
            let dictionary = response.result.value as! [String:AnyObject]
            let arrayResults = dictionary["results"] as! [[String:Any]]
            self.lastPage = dictionary["total_pages"] as! Int
            for item in arrayResults {
                let movie = Movie(object: item)
                self.arrayMovie.append(movie)
            }
            self.delegate?.didFinishLoading()
        } else {
            self.delegate?.didFailLoading(with: response.result.description, code: nil)
        }
        
        
    }
    
    // MARK - Data object methods
    
    func movieObject() -> Movie {
        let movie = arrayMovie[currentMovie!]
        return movie
    }
    
    func selectMovieBy(row: Int) -> Movie {
        return arrayMovie[row]
    }
    
    func genreIds() -> [Int] {
        return arrayMovie[currentMovie!].genreIds ?? [Int]()
    }
    
}
