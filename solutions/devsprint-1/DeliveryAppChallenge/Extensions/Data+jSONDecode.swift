//
//  Data+jSONDecode.swift
//  DeliveryAppChallenge
//
//  Created by Dairan on 08/11/21.
//

import Foundation

extension Data {
    func jSONDecode<T: Codable>(using strategy: JSONDecoder.KeyDecodingStrategy) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = strategy
        do {
            return try decoder.decode(T.self, from: self)
        } catch {
            return nil
        }
    }
}
