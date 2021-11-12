//
//  DeliveryApiError.swift
//  DeliveryAppChallenge
//
//  Created by Dairan on 11/11/21.
//

import Foundation

enum DeliveryApiError: Error {
    case invalidURL
    case dataError
    case decodificationError(String?)
    case serverError
    case networkError(Int)
    case responseError

        // MARK: Internal

    var message: String {
        switch self {
            case .invalidURL:
                return "URL inválida."
            case .decodificationError:
                return "Erro ao decodificar o JSON."
            case .serverError:
                return "Servidor não encontrado."
            case .networkError:
                return "Erro de conexão."
            case .responseError:
                return "Sem resposta do servidor."
            case .dataError:
                return "Não foi possível obter os dados do servidor."
        }
    }
}
