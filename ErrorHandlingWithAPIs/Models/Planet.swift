//
//  Planet.swift
//  ErrorHandlingWithAPIs
//
//  Created by Cory Tripathy on 5/2/23.
//

import Foundation

struct Planet: Decodable, Identifiable {
    let name: String
    let population: String
    var id: String {
        name + population
    }
}
