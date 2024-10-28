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
                VStack(alignment: .leading) {
                    // Welcome message
                    Text("Welcome back!")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Manolo Ruíz")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Text("4 new notifications")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                Image("CompanyIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 70, maxHeight: 70)
            }
            .padding()
            
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
