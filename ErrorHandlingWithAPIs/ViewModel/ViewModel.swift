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
        
        //TODO: use a do block and a catch block to catch this error and set our fetchError property to one of the cases of our FetchError enum
        let (data, _) = try! await URLSession.shared.data(from: url)
        
        //TODO: use a do block and a catch block to catch this error and set our fetchError property to one of the cases of our FetchError enum
        let decodedData = try! JSONDecoder().decode(Response.self, from: data)
        
        self.planets = decodedData.results
    }
}
