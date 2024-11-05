//
//  CalendarEvent.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 28/10/24.
//

import Foundation

struct CalendarEvent: Identifiable, Hashable {
    let id = UUID()
    let date: Date
    let title: String
    let created_by: String
}
