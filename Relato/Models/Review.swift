//
//  Review.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 23/10/24.
//

import Foundation
import SwiftData

@Model
class Review: Identifiable {
    @Attribute var id: UUID = UUID()
    @Attribute var reviewer: String
    @Attribute var title: String
    @Attribute var reviewBody: String
    @Attribute var starsGiven: Int
    
    init(reviewer: String, title: String, reviewBody: String, starsGiven: Int) {
        self.reviewer = reviewer
        self.title = title
        self.reviewBody = reviewBody
        self.starsGiven = starsGiven
    }
}
