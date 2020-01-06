//
//  Decodable+Extensions.swift
//  CurrencyPlay
//
//  Created by Dariy Kordiyak on 03.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import Foundation

extension Decodable {

    init?(dict: [String: Any]) throws {
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else {
            print("Decodable+Extensions: data from dict conversion failure")
            return nil
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromUpperCamelCase

        self = try decoder.decode(Self.self, from: data)
    }

}

extension JSONDecoder.KeyDecodingStrategy {

    static var convertFromUpperCamelCase: JSONDecoder.KeyDecodingStrategy {
        return .custom { codingKeys in
            var key = CustomCodingKey(codingKeys.last)

            // lowercase first letter
            if let firstChar = key.stringValue.first {
                let i = key.stringValue.startIndex
                key.stringValue.replaceSubrange(
                    i ... i, with: String(firstChar).lowercased()
                )
            }

            return key
        }
    }

}

/// Maps JSON keys to model's properties (convertFromUpperCamelCase) and vice versa (convertToUpperCamelCase)
struct CustomCodingKey: CodingKey {

    // MARK: - Properties
    var stringValue: String
    var intValue: Int?

    // MARK: - Init
    init(_ base: CodingKey?) {
        self.init(stringValue: base?.stringValue ?? "", intValue: base?.intValue ?? 0)
    }

    init(stringValue: String) {
        self.stringValue = stringValue
    }

    init(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }

    init(stringValue: String, intValue: Int?) {
        self.stringValue = stringValue
        self.intValue = intValue
    }

}
