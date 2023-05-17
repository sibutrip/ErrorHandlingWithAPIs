//
//  FetchError.swift
//  ErrorHandlingWithAPIs
//
//  Created by Cory Tripathy on 5/2/23.
//

import Foundation


// use these errors within your View
enum FetchError {
    case urlSessionError(Error)
    case invalidJSONResponse
}

extension FetchError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .urlSessionError:
            return NSLocalizedString("Could not process url request", comment: "Fetch Error")
        case .invalidJSONResponse:
            return NSLocalizedString("Could not read JSON response", comment: "JSON Decoding Error")
        }
    }
}
