//
//  Communication.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 22/10/24.
//

import Foundation
import SwiftData

@Model
class Communication: Identifiable {
    let id = UUID()
    let subject: String
    let sending_group: String
    let category: String
    let future: Bool
    
    init(subject: String, sending_group: String, category: String, future: Bool) {
            self.subject = subject
            self.sending_group = sending_group
            self.category = category
            self.future = future
        }
}

