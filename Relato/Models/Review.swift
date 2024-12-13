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
    @Attribute var comment: String
    @Attribute var rating: Int
    
    init(reviewer: String, title: String, comment: String, rating: Int) {
        self.reviewer = reviewer
        self.title = title
        self.comment = comment
        self.rating = rating
    }
}
