//
//  Reviews.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 12/11/24.
//

import Foundation
import SwiftUI

struct ReviewsListView: View {
    @State private var reviews: [Review] = [
        Review(reviewer: "John Doe", title: "Good!", comment: "Excellent service!", rating: 5),
        Review(reviewer: "Jane Smith", title: "Just okay", comment: "Very good experience.", rating: 4),
        Review(reviewer: "Bob Johnson", title: "Fk y'all!!", comment: "Average, room for improvement.", rating: 3)
    ]
    @State private var showNewReviewSheet = false

    var body: some View {
        List(reviews) { review in
            VStack(alignment: .leading) {
                HStack {
                    Text(review.reviewer)
                        .font(.headline)
                    Spacer()
                    Text("\(review.rating) ★")
                        .foregroundColor(.yellow)
                }
                Text(review.comment)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Reviews List")
        .overlay(
            Button(action: {
                showNewReviewSheet = true
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color("AccentColor"))
                    .clipShape(Circle())
                    .padding()
            }
            .sheet(isPresented: $showNewReviewSheet) {
                NewReviewView()
            },
            alignment: .bottomTrailing
        )
    }
}

struct ReplyToReviewsView: View {
    // Placeholder for future functionality
    var body: some View {
        Text("Reply to Reviews")
            .navigationTitle("Reply to Reviews")
            .padding()
        // Future integration with Firebase to fetch reviews and enable replies
    }
}

struct LaunchSurveyView: View {
    // Placeholder for future functionality
    var body: some View {
        Text("Launch a Survey")
            .navigationTitle("Launch Survey")
            .padding()
        // Future functionality to create and launch surveys
    }
}

struct VisualizeSurveyResultsView: View {
    // Placeholder for future functionality
    var body: some View {
        Text("Visualize Survey Results")
            .navigationTitle("Survey Results")
            .padding()
        // Future functionality to visualize survey data from Firebase
    }
}
