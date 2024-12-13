//
//  Task.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 12/11/24.
//

import Foundation
import SwiftData

@Model
class Task: Identifiable {
    var id: String
    var title: String
    var dueDate: String
    
    init(id: String, title: String, dueDate: String) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
    }
}
