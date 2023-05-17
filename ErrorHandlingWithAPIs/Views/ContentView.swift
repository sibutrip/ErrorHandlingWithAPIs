//
//  ContentView.swift
//  ErrorHandlingWithAPIs
//
//  Created by Cory Tripathy on 5/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    @State var didRaiseError = false
    @State var searchText = ""
    @State var fetchError: FetchError?
    
    var body: some View {
        VStack {
            List {
                Section("search") {
                    TextField("URL", text: $vm.urlPath)
                        .onSubmit {
                            Task {
                                // TODO: catch the errors from this throwing function. if the function throws errors, set "didRaiseError" to true
                                do {
                                    try await vm.fetchPlanets()
                                } catch {
                                    didRaiseError = true
                                    self.fetchError = error as? FetchError
                                }
                            }
                        }
                }
                Section("planets") {
                    ForEach(vm.planets) { planet in
                        HStack {
                            Text(planet.name)
                            Spacer()
                            Text(planet.population)
                        }
                    }
                }
            }
            //TODO: use this alert to monitor "didRaiseError" - if it changes to true, display our vm.fetchError
            .alert(isPresented: $didRaiseError, error: fetchError) {
                Button("okay") {
                    didRaiseError = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
