//
//  Lead.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 12/11/24.
//

import Foundation
import SwiftData

@Model
class Lead: Identifiable {
    var id: String
    var name: String
    var priority: String
    
    init(id: String, name: String, priority: String) {
        self.id = id
        self.name = name
        self.priority = priority
    }
}
