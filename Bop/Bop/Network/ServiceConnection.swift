//
//  ServiceConnection.swift
//  Bop
//
//  Created by Hoff Henry Pereira da Silva on 19/02/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation
import Alamofire
import FCAlertView


typealias obj = (Alamofire.DataResponse<Any>) -> Swift.Void

class ServiceConnection {
    
    static func fetchData(endPointURL: String, responseJSON: @escaping obj) {
        if !verifyConnection() {
            let alert = FCAlertView()
            alert.showAlert(withTitle: "Error", withSubtitle: "The internet connection has some problem", withCustomImage: nil, withDoneButtonTitle: nil, andButtons: nil)
            alert.dismissOnOutsideTouch = true
            alert.hideDoneButton = true
            alert.makeAlertTypeCaution()
        }
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
