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
        plist.save("\(pageNumber)", forKey: "default_page_number", toPlistWithName: "Constants") { (error) in
            
        }
    }
    
    static func setDefaultLanguage(language: String) {
        plist.save("\(language)", forKey: "default_language", toPlistWithName: "Constants") { (error) in
            
        }
    }
    
    static func defaultPosterURL() -> String {
        guard let posterURL = plist.fetchValue(for: "poster_main_url", fromPlistWithName: "Constants") else {return ""}
        return posterURL as! String
    }
    
    public static func translatesURL() -> String {
        guard let mainURL =  plist.fetchValue(for: "api_main_url", fromPlistWithName: "Constants") else {return ""}
        guard let apiKey =  plist.fetchValue(for: "api_key", fromPlistWithName: "Constants") else {return ""}
        guard let translates =  plist.fetchValue(for: "GET_TRANSLATES", fromPlistWithName: "Constants") else {return ""}
        //https://api.themoviedb.org/3/configuration/primary_translations?api_key=<<api_key>>
        return "\(mainURL as! String)\(translates as! String)\(apiKey as! String)"
    }
    
    public static func upcomigMoviesURL() -> String {
        guard let mainURL =  plist.fetchValue(for: "api_main_url", fromPlistWithName: "Constants") else {return ""}
        guard let apiKey =  plist.fetchValue(for: "api_key", fromPlistWithName: "Constants") else {return ""}
        guard let upcomingMovies =  plist.fetchValue(for: "GET_UPCOMING_MOVIESs", fromPlistWithName: "Constants") else {return ""}
        guard let defaultLanguage =  plist.fetchValue(for: "default_language", fromPlistWithName: "Constants") else {return ""}
        guard let defaultPageNumber =  plist.fetchValue(for: "default_page_number", fromPlistWithName: "Constants") else {return ""}
        //https://api.themoviedb.org/3/movie/upcoming?api_key=1f54bd990f1cdfb230adb312546d765d&language=pt-BR
        return "\(mainURL as! String)\(upcomingMovies as! String)\(apiKey as! String)\(defaultLanguage as! String)\(defaultPageNumber as! String)"
    }
    
}
