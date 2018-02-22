//
//  ServiceConnection.swift
//  Bop
//
//  Created by Hoff Henry Pereira da Silva on 19/02/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation
import Alamofire

typealias obj = (Alamofire.DataResponse<Any>) -> Swift.Void

class ServiceConnection {
    
    
    
    static func fetchData(endPointURL: String, responseJSON: @escaping obj) {
        
        if !verifyConnection() {
            
            return
        }
        let url = "https://api.themoviedb.org/3/search/movie?api_key=1f54bd990f1cdfb230adb312546d765d&language=en-US&query=panther&page=1​&include_adult=false"
        Alamofire.request(endPointURL.trimmingCharacters(in: .whitespaces)).responseJSON { (response) in
            responseJSON(response)
        }
        
    }
    
    
    
    private static func verifyConnection() -> Bool{
        
        if let reachabilityNetwork = Alamofire.NetworkReachabilityManager(host: "www.google.com") {
            
            if reachabilityNetwork.isReachable {
                return true
            }
        }
        
        return false
        
    }
    
}
