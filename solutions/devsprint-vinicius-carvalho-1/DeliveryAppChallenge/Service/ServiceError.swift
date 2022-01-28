//
//  ServiceError.swift
//  DeliveryAppChallenge
//
//  Created by Alley Pereira on 24/01/22.
//

import Foundation

enum ServiceError: Error {
    case requestFailed(description: String)
	case emptyData
    case decodeError

	var localizedDescription: String {
		switch self {
		case .emptyData:
			return "No error was received but we also don't have data."
		case .requestFailed(description: let description):
			return "Could not run request because: \(description)"
		case .decodeError:
			return "Could not decoded result"
		}
	}
}
