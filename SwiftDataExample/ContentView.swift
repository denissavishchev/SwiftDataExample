//
//  ContentView.swift
//  SwiftDataExample
//
//  Created by Devis on 06/11/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path){
            DestinationListingView(sort: sortOrder, searchString: searchText)
                .navigationTitle("Traveler")
                .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
                .searchable(text: $searchText)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Menu("Sort", systemImage: "arrow.up.arrow.down"){
                            Picker("Sort", selection: $sortOrder){
                                Text("Name")
                                    .tag(SortDescriptor(\Destination.name))
                                Text("Prioruty")
                                    .tag(SortDescriptor(\Destination.priority, order: .reverse))
                                Text("Date")
                                    .tag(SortDescriptor(\Destination.date))
                            }
                            .pickerStyle(.inline)
                        }
                    }
                    ToolbarItem{
                        Button("Add destination", systemImage: "plus", action: addDestination)
                    }
                    
            }
        }
    }
    
    func addDestination(){
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Destination.self)
}
