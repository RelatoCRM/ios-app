//
//  Campaigns.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 12/11/24.
//

import SwiftUI

struct AllCampaignsView: View {
    @State private var campaigns: [Campaign] = [
        Campaign(id: "1", name: "Email Blast", status: "Active"),
        Campaign(id: "2", name: "Holiday Promotion", status: "Scheduled"),
        Campaign(id: "3", name: "Spring Sale", status: "Completed")
    ]
    @State private var showNewCampaignSheet = false

    var body: some View {
        List(campaigns) { campaign in
            VStack(alignment: .leading) {
                Text(campaign.name)
                    .font(.headline)
                Text(campaign.status)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("All Campaigns")
        .overlay(
            Button(action: {
                showNewCampaignSheet = true
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color("AccentColor"))
                    .clipShape(Circle())
                    .padding()
            }
            .sheet(isPresented: $showNewCampaignSheet) {
                NewCampaignView()
            },
            alignment: .bottomTrailing
        )
    }
}

struct InactiveCampaignsView: View {
    @State private var campaigns: [Campaign] = [
        Campaign(id: "4", name: "Old Campaign", status: "Inactive"),
        Campaign(id: "5", name: "Expired Offer", status: "Inactive"),
        Campaign(id: "6", name: "Outdated Promo", status: "Inactive")
    ]
    @State private var showNewCampaignSheet = false

    var body: some View {
        List(campaigns) { campaign in
            VStack(alignment: .leading) {
                Text(campaign.name)
                    .font(.headline)
                Text(campaign.status)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Inactive Campaigns")
        .overlay(
            Button(action: {
                showNewCampaignSheet = true
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color("AccentColor"))
                    .clipShape(Circle())
                    .padding()
            }
            .sheet(isPresented: $showNewCampaignSheet) {
                NewCampaignView()
            },
            alignment: .bottomTrailing
        )
    }
}

struct SendingGroupsView: View {
    @State private var groups: [String] = ["Newsletter Subscribers", "VIP Customers", "Leads from Expo"]
    @State private var showNewGroupSheet = false

    var body: some View {
        List(groups, id: \.self) { group in
            Text(group)
                .font(.headline)
        }
        .navigationTitle("Sending Groups")
        .overlay(
            Button(action: {
                showNewGroupSheet = true
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color("AccentColor"))
                    .clipShape(Circle())
                    .padding()
            }
            .sheet(isPresented: $showNewGroupSheet) {
                NewSendingGroupView()
            },
            alignment: .bottomTrailing
        )
    }
}
