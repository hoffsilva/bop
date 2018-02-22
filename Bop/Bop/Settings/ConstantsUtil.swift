//
//  ConstantsUtil.swift
//  Bop
//
//  Created by Hoff Henry Pereira da Silva on 18/02/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation
import SwiftyPlistManager

class ConstantsUtil {
   
    private static let plist = SwiftyPlistManager.shared

    static func setDefaultPageNumber(pageNumber: String) {
        plist.save("&page=\(pageNumber)", forKey: "default_page_number", toPlistWithName: "Constants") { (error) in
        }
    }
    
    static func setDefaultLanguage(language: String) {
        plist.save("&language=\(language)", forKey: "default_language", toPlistWithName: "Constants") { (error) in
            
        }
    }
    
    static func defaultPosterURL() -> String {
        guard let posterURL = plist.fetchValue(for: "poster_main_url", fromPlistWithName: "Constants") else {return ""}
        return posterURL as! String
    }
    
    public static func upcomigMoviesURL() -> String {
        guard let mainURL =  plist.fetchValue(for: "api_main_url", fromPlistWithName: "Constants") else {return ""}
        guard let apiKey =  plist.fetchValue(for: "api_key", fromPlistWithName: "Constants") else {return ""}
        guard let upcomingMovies =  plist.fetchValue(for: "GET_UPCOMING_MOVIES", fromPlistWithName: "Constants") else {return ""}
        guard let defaultLanguage =  plist.fetchValue(for: "default_language", fromPlistWithName: "Constants") else {return ""}
        guard let defaultPageNumber =  plist.fetchValue(for: "default_page_number", fromPlistWithName: "Constants") else {return ""}
        //https://api.themoviedb.org/3/movie/upcoming?api_key=1f54bd990f1cdfb230adb312546d765d&language=pt-BR
        return "\(mainURL as! String)\(upcomingMovies as! String)\(apiKey as! String)\(defaultLanguage as! String)\(defaultPageNumber as! String)"
    }
    
    public static func searchMoviesURL(_ searchParameter: String) -> String {
        guard let mainURL =  plist.fetchValue(for: "api_main_url", fromPlistWithName: "Constants") else {return ""}
        guard let apiKey =  plist.fetchValue(for: "api_key", fromPlistWithName: "Constants") else {return ""}
        guard let searchMovies =  plist.fetchValue(for: "GET_SEARCH_MOVIES", fromPlistWithName: "Constants") else {return ""}
        guard let defaultLanguage =  plist.fetchValue(for: "default_language", fromPlistWithName: "Constants") else {return ""}
        guard let defaultPageNumber =  plist.fetchValue(for: "default_page_number", fromPlistWithName: "Constants") else {return ""}
        //return "https://api.themoviedb.org/3/search/movie?api_key=1f54bd990f1cdfb230adb312546d765d&language=en-US&page=1&include_adult=false&query=Amor"
        //return https://api.themoviedb.org/3/search/movie?api_key=1f54bd990f1cdfb230adb312546d765d&language=en-US&query=Amor&page=1&include_adult=false
        return "\(mainURL as! String)\(searchMovies as! String)\(apiKey as! String)\(defaultLanguage as! String)&query=\(searchParameter)\(defaultPageNumber as! String)".trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    
    public static func countriesURL() -> String {
        guard let mainURL =  plist.fetchValue(for: "api_main_url", fromPlistWithName: "Constants") else {return ""}
        guard let countries =  plist.fetchValue(for: "GET_COUNTRIES", fromPlistWithName: "Constants") else {return ""}
        guard let apiKey =  plist.fetchValue(for: "api_key", fromPlistWithName: "Constants") else {return ""}
        //https://api.themoviedb.org/3/configuration/countries?api_key=1f54bd990f1cdfb230adb312546d765d
        print("\(mainURL as! String)\(countries as! String)\(apiKey as! String)".trimmingCharacters(in: .whitespacesAndNewlines))
        return "\(mainURL as! String)\(countries as! String)\(apiKey as! String)".trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    
    public static func languagesURL() -> String {
        guard let mainURL =  plist.fetchValue(for: "api_main_url", fromPlistWithName: "Constants") else {return ""}
        guard let languages =  plist.fetchValue(for: "GET_LANGUAGES", fromPlistWithName: "Constants") else {return ""}
        guard let apiKey =  plist.fetchValue(for: "api_key", fromPlistWithName: "Constants") else {return ""}
        //https://api.themoviedb.org/3/configuration/languages?api_key=1f54bd990f1cdfb230adb312546d765d
        print("\(mainURL as! String)\(languages as! String)\(apiKey as! String)".trimmingCharacters(in: .whitespacesAndNewlines))
        return "\(mainURL as! String)\(languages as! String)\(apiKey as! String)".trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public static func translatesURL() -> String {
        guard let mainURL =  plist.fetchValue(for: "api_main_url", fromPlistWithName: "Constants") else {return ""}
        guard let apiKey =  plist.fetchValue(for: "api_key", fromPlistWithName: "Constants") else {return ""}
        guard let translates =  plist.fetchValue(for: "GET_TRANSLATES", fromPlistWithName: "Constants") else {return ""}
        //https://api.themoviedb.org/3/configuration/primary_translations?api_key=<<api_key>>
        print("\(mainURL as! String)\(translates as! String)\(apiKey as! String)")
        return "\(mainURL as! String)\(translates as! String)\(apiKey as! String)"
    }
    
}
