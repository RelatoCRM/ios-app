//
//  InfoCard.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 21/10/24.
//

import SwiftUI
      
struct LatestReviews: View {
    @State var reviews: [Review] = [
        Review(reviewer: "Diego Herrera", title: "La mejor experiencia de mi vida", comment: "Gracias a su asesoramiento tuve lo que necesitaba!", rating: 5),
        Review(reviewer: "Javier Borbón", title: "Una experiencia casi perfecta", comment: "Nos dieron exactamente lo que anunciaron", rating: 4),
        Review(reviewer: "Gracie Abrams", title: "Kinda awful", comment: "Had a good time but staff was", rating: 2)
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
                                    .frame(height: 30)
                                    .padding(.horizontal, 15)
                                
                                VStack(alignment: .leading) {
                                    Text(review.reviewer)
                                        .font(.headline)
                                    Text(review.title)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            HStack(spacing: 2) {
                                ForEach(0..<review.rating, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .frame(width: 20)
                                }
                                ForEach(review.rating..<5, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.gray)
                                        .frame(width: 20)
                                }
                            }
                            .frame(width: 100, alignment: .trailing)
                        }
                        .padding()
                        .frame(height: 60)
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
