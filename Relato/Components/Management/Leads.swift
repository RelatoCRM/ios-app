//
//  Lead.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 12/11/24.
//

import SwiftUI

struct RecentLeadsView: View {
    @State private var leads: [Lead] = [
        Lead(id: "1", name: "John Doe", priority: "Medium"),
        Lead(id: "2", name: "Jane Smith", priority: "High"),
        Lead(id: "3", name: "Bob Johnson", priority: "Low")
    ]
    @State private var showNewLeadSheet = false

    var body: some View {
        List(leads) { lead in
            VStack(alignment: .leading) {
                Text(lead.name)
                    .font(.headline)
                Text("Priority: \(lead.priority)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Recent Leads")
        .overlay(
            Button(action: {
                showNewLeadSheet = true
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color("AccentColor"))
                    .clipShape(Circle())
                    .padding()
            }
            .sheet(isPresented: $showNewLeadSheet) {
                NewLeadView()
            },
            alignment: .bottomTrailing
        )
    }
}

struct HighPriorityLeadsView: View {
    @State private var leads: [Lead] = [
        Lead(id: "4", name: "Alice Brown", priority: "High"),
        Lead(id: "5", name: "Charlie Davis", priority: "High"),
        Lead(id: "6", name: "Eve Foster", priority: "High")
    ]
    @State private var showNewLeadSheet = false

    var body: some View {
        List(leads) { lead in
            VStack(alignment: .leading) {
                Text(lead.name)
                    .font(.headline)
                Text("Priority: \(lead.priority)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("High Priority Leads")
        .overlay(
            Button(action: {
                showNewLeadSheet = true
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color("AccentColor"))
                    .clipShape(Circle())
                    .padding()
            }
            .sheet(isPresented: $showNewLeadSheet) {
                NewLeadView()
            },
            alignment: .bottomTrailing
        )
    }
}

struct CustomerSegmentInsightsView: View {
    // Placeholder for future data
    var body: some View {
        Text("Customer Segment Insights")
            .navigationTitle("Customer Insights")
            .padding()
        // Future integration with Firebase to fetch and display customer insights
    }
}
