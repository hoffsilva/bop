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
    var arrayLanguages = [Language]()
    var arrayCountry = [Country]()
    var arrayHandledLanguage = [HandledLanguage]()
    
    var selectedLanguage = ""
    
    var numberOfLanguages: Int {
        return arrayHandledLanguage.count
    }
    
    func loadTranslates() {
        
        loadCountries()
        loadLanguages()
        
        ServiceConnection.fetchData(endPointURL: ConstantsUtil.translatesURL()) { (response) in
            if response.error != nil {
                self.delegate?.didFailLoading(with: "Error", code: nil)
            } else {
                let translationsList = response.result.value as! [String]
                for translation in translationsList {
                    let cty = translation.suffix(2)
                    let lang = translation.prefix(2)
                    var handledLanguage = HandledLanguage()
                    
                    for language in self.arrayLanguages {
                        if language.iso6391! == lang {
                            handledLanguage.language = language.englishName
                            print(handledLanguage.dictionaryRepresentation())
                        }
                    }
                    
                    for country in self.arrayCountry {
                        if country.iso31661! == cty {
                            handledLanguage.country = country.englishName
                            print(handledLanguage.dictionaryRepresentation())
                        }
                    }
                    
                    handledLanguage.handledLanguage = translation
                    print(handledLanguage.dictionaryRepresentation())
                    self.arrayHandledLanguage.append(handledLanguage)
                }
                self.delegate?.didFinishLoading()
            }
        }
    }
    
    func loadCountries() {
        ServiceConnection.fetchData(endPointURL: ConstantsUtil.countriesURL()) { (response) in
            if response.error != nil {
                //self.delegate?.didFailLoading(with: "Error", code: nil)
            } else {
                let countriesList = response.result.value as! [[String:Any]]
                for country in countriesList {
                    let country = Country(object: country)
                    self.arrayCountry.append(country)
                }
            }
        }
    }
    
    func loadLanguages() {
        ServiceConnection.fetchData(endPointURL: ConstantsUtil.languagesURL()) { (response) in
            if response.error != nil {
                //self.delegate?.didFailLoading(with: "Error", code: nil)
            } else {
                let languagesList = response.result.value as! [[String:Any]]
                for language in languagesList {
                    let language = Language(object: language)
                    self.arrayLanguages.append(language)
                }
            }
        }
    }
    
    func handledNameOfLanguage(_ row: Int) -> String {
        let lang = arrayHandledLanguage[row].language ?? ""
        let country = arrayHandledLanguage[row].country ?? ""
        return "\(lang) - \(country)"
    }
    
    func setNewLanguage() {
        ConstantsUtil.setDefaultLanguage(language: selectedLanguage)
    }
}
