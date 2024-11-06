//
//  SwiftDataExampleApp.swift
//  SwiftDataExample
//
//  Created by Devis on 06/11/2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
