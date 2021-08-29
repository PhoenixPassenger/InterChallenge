//
//  DecodeError.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
enum DecodeError: Error {
    case noDataProvided
    case decodeFailure(description: String)

    var localizedDescription: String {
        switch self {
        case .noDataProvided:
            return "No data provided."
        case .decodeFailure(let description):
            return "Decode failure : \(description)."
        }
    }
}
