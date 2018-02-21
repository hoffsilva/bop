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
    
    var searchParameter: Observable<String>!
    
    var currentMovie: Int!
    
    var arrayMovie = [Movie]()
    
    var arraySearchedMovie: [Movie]?
    
    var lastPage: Int!
    
    var numberOfMovies: Int {
        return arrayMovie.count 
    }
    
    var numberOfSeachedMovies: Int {
        return arraySearchedMovie?.count ?? 0
    }
    
    
    func loadMovies() {
        ServiceConnection.fetchData(endPointURL: ConstantsUtil.upcomigMoviesURL()) { (response) in
            if response.error != nil {
                self.delegate?.didFailLoading(with: "Error", code: nil)
            } else {
                let dictionary = response.result.value as! [String:AnyObject]
                let arrayResults = dictionary["results"] as! [[String:Any]]
                self.lastPage = dictionary["total_pages"] as! Int
                for item in arrayResults {
                    let movie = Movie(object: item)
                    self.arrayMovie.append(movie)
                }
                self.delegate?.didFinishLoading()
            }
        }
    }
    
    func searchMovies() {
        arraySearchedMovie = [Movie]()
        for movie in arrayMovie {
            if (((movie.title?.range(of: self.searchParameter.value!)) != nil)) || (((movie.originalTitle?.range(of: self.searchParameter.value!)) != nil)) || (((movie.overview?.range(of: self.searchParameter.value!)) != nil)) {
                arraySearchedMovie?.append(movie)
            }
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
