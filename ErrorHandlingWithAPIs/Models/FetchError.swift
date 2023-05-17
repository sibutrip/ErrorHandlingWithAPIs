//
//  FetchError.swift
//  ErrorHandlingWithAPIs
//
//  Created by Cory Tripathy on 5/2/23.
//

import Foundation


// use these errors within your ViewModel
enum FetchError {
    case urlSessionError(Error)
    case invalidUrl
}

extension FetchError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .urlSessionError:
            return NSLocalizedString("Could not process url request", comment: "Fetch Error")
        case .invalidUrl:
            return NSLocalizedString("Could not create URL", comment: "URL Creation Error")
        }
    }
}
