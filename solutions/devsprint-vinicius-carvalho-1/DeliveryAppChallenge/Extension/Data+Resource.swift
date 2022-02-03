//
//  Data+DataSource.swift
//  DeliveryAppChallenge
//
//  Created by Gustavo Soares on 25/01/22.
//

import Foundation

extension Data {
    static func readData(from fileNamed: String) -> Data? {
        if let url = Bundle.main.url(forResource: fileNamed, withExtension: "json") {
            do {
                return try Data(contentsOf: url)
            } catch {
                return nil
            }
        }
        return nil
    }
}
