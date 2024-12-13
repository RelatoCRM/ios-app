//
//  Automation.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 12/11/24.
//

import Foundation
import SwiftData

@Model
class Automation: Identifiable {
    var id: String
    var name: String
    var isActive: Bool
    
    init(id: String, name: String, isActive: Bool) {
        self.id = id
        self.name = name
        self.isActive = isActive
    }
}
