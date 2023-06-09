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
                                // TODO: catch the errors from this throwing function. if the function throws errors, catch the error: set "didRaiseError" to true, and fetchError as the thrown error (use conditional downcasting: fetchError = error as? FetchError)
                                try await vm.fetchPlanets()
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
