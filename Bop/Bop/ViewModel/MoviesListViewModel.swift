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
    var currentMovie: Observable<Int>!
    
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
        var tempArray = [Movie]()
        ServiceConnection.fetchData(endPointURL: ConstantsUtil.upcomigMoviesURL()) { (response) in
            if response.error != nil {
                self.delegate?.didFailLoading(with: "Error", code: nil)
            } else {
                let dictionary = response.result.value as! [String:AnyObject]
                let arrayResults = dictionary["results"] as! [[String:Any]]
                self.lastPage = dictionary["total_pages"] as! Int
                for item in arrayResults {
                    let movie = Movie(object: item)
                    tempArray.append(movie)
                }
                self.arrayMovie = tempArray
                self.delegate?.didFinishLoading()
            }
        }
    }
    
    func searchMovies() {
        arraySearchedMovie = [Movie]()
        for movie in arrayMovie! {
            if (((movie.title?.range(of: self.searchParameter.value!)) != nil)) || (((movie.originalTitle?.range(of: self.searchParameter.value!)) != nil)) || (((movie.overview?.range(of: self.searchParameter.value!)) != nil)) {
                arraySearchedMovie?.append(movie)
            }
        }
    }
    
    
    // MARK - Data object methods
    
    func posterPath() -> String {
        let movie = arrayMovie![currentMovie.value!]
        return "\(ConstantsUtil.defaultPosterURL())\(movie.posterPath!)"
    }
//    static let backdropPath = "backdrop_path"
//    static let genreIds = "genre_ids"
//    static let voteCount = "vote_count"
//    static let overview = "overview"
//    static let originalTitle = "original_title"
//    static let popularity = "popularity"
//    static let releaseDate = "release_date"
//    static let id = "id"
//    static let video = "video"
//    static let originalLanguage = "original_language"
//    static let voteAverage = "vote_average"
//    static let title = "title"
//    static let adult = "adult"
    
    
}
