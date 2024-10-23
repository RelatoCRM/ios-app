//
//  InfoCard.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 21/10/24.
//

import SwiftUI

import SwiftUI

struct LatestReviews: View {
    @State var reviews: [Review] = [
        Review(reviewer: "Diego Herrera", title: "Awful experience", reviewBody: "The whole thing was givin' nothing and it was so undone", starsGiven: 2),
        Review(reviewer: "Jane Doe", title: "Great experience", reviewBody: "I loved everything about it!", starsGiven: 5)
    ]
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Latest Reviews")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "arrow.right").foregroundStyle(Color("AccentColor"))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading, .trailing])
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView {
                Grid {
                    ForEach(reviews) { review in
                        GridRow {
                            HStack {
                                Image(systemName: "quote.bubble.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 30) // Match the row height
                                    .padding(.horizontal, 15)
                                
                                VStack(alignment: .leading) {
                                    Text(review.reviewer)
                                        .font(.headline)
                                    Text(review.title)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading) // Take more space for name and title
                            }
                            
                            HStack(spacing: 2) { // Reduced spacing between stars
                                ForEach(0..<review.starsGiven, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .frame(width: 20) // Adjust star size
                                }
                                ForEach(review.starsGiven..<5, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.gray)
                                        .frame(width: 20) // Adjust star size
                                }
                            }
                            .frame(width: 100, alignment: .trailing) // Assign width to stars, keeping them compact
                        }
                        .padding()
                        .frame(height: 60) // Increased row height
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }
}

#Preview {
    LatestReviews()
}
