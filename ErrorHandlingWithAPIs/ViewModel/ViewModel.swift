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
    @Published var urlPath: String = ""
    
    func fetchPlanets() async throws {
        
        guard let url = URL(string: "https://swapi.dev/api/\(urlPath.lowercased())") else {
            return
        }
        
        var data = Data()
        
        //TODO: use a do block and a catch block to catch this error and throw our own error - one of the cases of our FetchError enum
        (data, _) = try! await URLSession.shared.data(from: url)
        
        //TODO: use a do block and a catch block to catch this error and throw our own error - one of the cases of our FetchError enum
        let decodedData = try! JSONDecoder().decode(Response.self, from: data)
        
        self.planets = decodedData.results
    }
}
