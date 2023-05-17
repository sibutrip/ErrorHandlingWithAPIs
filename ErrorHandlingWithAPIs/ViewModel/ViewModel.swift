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
        do {
            (data, _) = try await URLSession.shared.data(from: url)
        } catch {
            throw FetchError.urlSessionError(error)
        }
        
        do {
            let decodedData = try JSONDecoder().decode(Response.self, from: data)
            self.planets = decodedData.results
        } catch {
            throw FetchError.invalidJSONResponse
        }
    }
}
