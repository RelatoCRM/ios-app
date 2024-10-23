//
//  InfoCard.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 21/10/24.
//

import SwiftUI

struct InfoCard: View {
    @State var reviews: [Review] = [
        Review(reviewer: "Diego Herrera", title: "Awful ask", reviewBody: "The whole thing was givin' nothing and it was so undone", starsGiven: 2),
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
                    Image(systemName: "arrow.right")
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
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            .frame(maxWidth: 50)
                            .padding(.leading)
                            
                            VStack(alignment: .leading) {
                                Text(review.reviewer)
                                    .font(.headline)
                                Text(review.title)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            HStack {
                                ForEach(0..<review.starsGiven, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                                ForEach(review.starsGiven..<5, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.gray)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                        }
                        .padding(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 30)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }
}

#Preview {
    InfoCard()
}
