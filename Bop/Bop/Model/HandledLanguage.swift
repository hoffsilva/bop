//
//  HandledLanguage.swift
//
//  Created by Hoff Henry Pereira da Silva on 22/02/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class HandledLanguage {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let handledLanguage = "handled_language"
        static let language = "language"
        static let country = "country"
    }
    
    // MARK: Properties
    public var handledLanguage: String?
    public var language: String?
    public var country: String?
    
    init() {
        
    }
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(json: JSON) {
        handledLanguage = json[SerializationKeys.handledLanguage].string
        language = json[SerializationKeys.language].string
        country = json[SerializationKeys.country].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = handledLanguage { dictionary[SerializationKeys.handledLanguage] = value }
        if let value = language { dictionary[SerializationKeys.language] = value }
        if let value = country { dictionary[SerializationKeys.country] = value }
        return dictionary
    }
    
}
