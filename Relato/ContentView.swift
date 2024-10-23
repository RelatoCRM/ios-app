//
//  ContentView.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 17/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
            }
            ReviewsView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Reviews")
            }
            ManagementView()
                .tabItem {
                    Image(systemName: "mail.and.text.magnifyingglass")
                    Text("Management")
            }
            CommunicationsView()
                .tabItem {
                    Image(systemName: "tray.and.arrow.up.fill")
                    Text("Mailbox")
                }
            ConfigurationView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Configuration")
                }
        }.accentColor(Color("AccentColor"))
    }
    }

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
