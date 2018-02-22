//
//  Language.swift
//
//  Created by Hoff Henry Pereira da Silva on 22/02/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Language: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let englishName = "english_name"
    static let name = "name"
    static let iso6391 = "iso_639_1"
  }

  // MARK: Properties
  public var englishName: String?
  public var name: String?
  public var iso6391: String?

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
    englishName = json[SerializationKeys.englishName].string
    name = json[SerializationKeys.name].string
    iso6391 = json[SerializationKeys.iso6391].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = englishName { dictionary[SerializationKeys.englishName] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = iso6391 { dictionary[SerializationKeys.iso6391] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.englishName = aDecoder.decodeObject(forKey: SerializationKeys.englishName) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.iso6391 = aDecoder.decodeObject(forKey: SerializationKeys.iso6391) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(englishName, forKey: SerializationKeys.englishName)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(iso6391, forKey: SerializationKeys.iso6391)
  }

}
