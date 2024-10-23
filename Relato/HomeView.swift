//
//  HomeView.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 21/10/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            HStack{
                VStack {
                    // Welcome message
                    Text("Welcome back!")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Manolo Ruíz")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Salesforce")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                AvatarView(imageName: "Avatar", borderColor: Color("AccentColor"), size: 57).padding(.bottom, 7)
            }
            .padding()
            
            HStack {
                // Sales Widget
                SalesWidget()
                    .frame(maxWidth: .infinity)
                
                // Conversion Rate Widget
                ConversionRateWidget()
                    .frame(maxWidth: .infinity)
            }.padding(.horizontal)
            
            // Chart view
            ChartView()
                        
            // Latest Reviews or additional content
            LatestReviews()
        }.background(Color("BackgroundColor"))
    }
}

#Preview {
    HomeView()
}
