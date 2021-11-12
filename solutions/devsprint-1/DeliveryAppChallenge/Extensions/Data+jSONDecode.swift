//
//  Data+jSONDecode.swift
//  DeliveryAppChallenge
//
//  Created by Dairan on 08/11/21.
//

import Foundation

extension Data {
    func jSONDecode<T: Codable>(using strategy: JSONDecoder.KeyDecodingStrategy) -> Result<T, DeliveryApiError> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = strategy
        do {
            let decodedData = try decoder.decode(T.self, from: self)
            return .success(decodedData)
        } catch {
            return .failure(DeliveryApiError.decodificationError(error.localizedDescription))
        }
    }
}
