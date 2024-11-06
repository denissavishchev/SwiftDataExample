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
    @Query var destinations: [Destination]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(destinations){destination in
                    VStack(alignment: .leading){
                        Text(destination.name)
                            .font(.headline)
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .navigationTitle("Traveler")
            .toolbar{
                Button("Add", action: addSamples)
            }
        }
    }
    
    func addSamples(){
        let rome = Destination(name: "UK")
        
        modelContext.insert(rome)
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Destination.self)
}
