//
//  EditDestinationView.swift
//  SwiftDataExample
//
//  Created by Devis on 07/11/2024.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    
    @Bindable var destination: Destination
    @State private var newSightName = ""
    
    var body: some View {
        Form{
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
            
            Section("Priority"){
                Picker("Priority", selection: $destination.priority){
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(.segmented)
            }
            Section("Sights"){
                ForEach(destination.sights){ sight in
                    Text(sight.name)
                }
                HStack{
                    TextField("Add new Sight in \(destination.name)", text: $newSightName)
                    Button("Add", action: addSight)
                }
            }
        }
        .navigationTitle("Edit destination")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addSight(){
        guard newSightName.isEmpty == false else {return}
        withAnimation{
            let sight = SightModel(name: newSightName)
            destination.sights.append(sight)
            newSightName = ""
        }
    }
    
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        let example = Destination(name: "Example", details: "Automatically expand")
        return EditDestinationView(destination: example)
            .modelContainer(container)
    } catch{
        fatalError("Failed to create model container")
    }

}
