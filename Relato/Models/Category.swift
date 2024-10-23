//
//  Category.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 22/10/24.
//

import Foundation
import SwiftData

@Model
class Category: Identifiable {
    let id: UUID = UUID()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
