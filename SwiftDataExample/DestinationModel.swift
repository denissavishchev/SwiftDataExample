//
//  Destination.swift
//  SwiftDataExample
//
//  Created by Devis on 06/11/2024.
//

import Foundation
import SwiftData

@Model
class Destination{
    var name: String
    var details: String
    var date: Date
    var priority: Int
    @Relationship(deleteRule: .cascade) var sights = [SightModel]()
    
    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
