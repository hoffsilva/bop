//
//  LanguagesListViewModel.swift
//  Bop
//
//  Created by Hoff Henry Pereira da Silva on 19/02/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

protocol LanguagesListDelegate: class {
    /// Called when request for Languages list has finished loading
    func didFinishLoading()
    
    /// Called if request for Languages list has failed
    ///
    /// - Parameter errorMessage: Message describing error
    func didFailLoading(with errorMessage: String, code errorCode: Int?)
}

class LanguagesListViewModel {
    
    weak var delegate: LanguagesListDelegate?
    var arrayLanguages = [String]()
    var selectedLanguage = ""
    
    var numberOfLanguages: Int {
        return arrayLanguages.count
    }
    
    func loadLanguages() {
        ServiceConnection.fetchData(endPointURL: ConstantsUtil.translatesURL()) { (response) in
            if response.error != nil {
                self.delegate?.didFailLoading(with: "Error", code: nil)
            } else {
                let dictionary = response.result.value as! [String]
                self.arrayLanguages = dictionary
                self.delegate?.didFinishLoading()
            }
        }
    }
    
    func setNewLanguage() {
        ConstantsUtil.setDefaultLanguage(language: selectedLanguage)
    }
}
