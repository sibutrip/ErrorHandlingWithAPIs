//
//  ViewModel.swift
//  ErrorHandlingWithAPIs
//
//  Created by Cory Tripathy on 5/2/23.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var planets: [Planet] = []
    @Published var fetchError: FetchError?
    @Published var urlPath: String = ""
    
    
    func fetchPlanets() async throws {
        
        guard let url = URL(string: "https://swapi.dev/api/\(urlPath.lowercased())") else {
            return
        }
        
        /// the following 2 functions marked with "try" throw errors. safely handle those errors by
        /// 1) catching each of them with a do block and a catch block
        /// 2) in each catch block, setting our published fetchError to one of the cases of our FetchError enum
        let (data, _) = try! await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let decodedData = try! decoder.decode(Response.self, from: data)
        self.planets = decodedData.results
    }
}
