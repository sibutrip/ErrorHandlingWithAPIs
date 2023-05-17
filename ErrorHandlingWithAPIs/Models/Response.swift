//
//  Response.swift
//  ErrorHandlingWithAPIs
//
//  Created by Cory Tripathy on 5/2/23.
//

import Foundation

struct Response: Decodable {
    let results: [Planet]
}
