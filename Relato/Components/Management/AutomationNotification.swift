//
//  AutomationNotification.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 12/11/24.
//

import Foundation
import SwiftUI

struct AllAutomationsView: View {
    @State private var automations: [Automation] = [
        Automation(id: "1", name: "Welcome Email Sequence", isActive: true),
        Automation(id: "2", name: "Abandoned Cart Reminder", isActive: true),
        Automation(id: "3", name: "Re-engagement Campaign", isActive: false)
    ]
    @State private var showNewAutomationSheet = false

    var body: some View {
        List(automations) { automation in
            VStack(alignment: .leading) {
                Text(automation.name)
                    .font(.headline)
                Text(automation.isActive ? "Active" : "Inactive")
                    .font(.subheadline)
                    .foregroundColor(automation.isActive ? .green : .red)
            }
        }
        .navigationTitle("All Automations")
        .overlay(
            Button(action: {
                showNewAutomationSheet = true
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color("AccentColor"))
                    .clipShape(Circle())
                    .padding()
            }
            .sheet(isPresented: $showNewAutomationSheet) {
                NewAutomationView()
            },
            alignment: .bottomTrailing
        )
    }
}

struct AllNotificationsView: View {
    @State private var notifications: [String] = ["System Update", "New Message from John", "Promotion Reminder"]
    @State private var showNewNotificationSheet = false

    var body: some View {
        List(notifications, id: \.self) { notification in
            Text(notification)
                .font(.headline)
        }
        .navigationTitle("All Notifications")
        .overlay(
            Button(action: {
                showNewNotificationSheet = true
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color("AccentColor"))
                    .clipShape(Circle())
                    .padding()
            }
            .sheet(isPresented: $showNewNotificationSheet) {
                NewNotificationView()
            },
            alignment: .bottomTrailing
        )
    }
}
