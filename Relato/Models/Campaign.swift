//
//  Campaign.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 12/11/24.
//

import Foundation
import SwiftData

@Model
class Campaign: Identifiable {
    var id: String
    var name: String
    var status: String
    
    init(id: String, name: String, status: String) {
        self.id = id
        self.name = name
        self.status = status
    }
}
