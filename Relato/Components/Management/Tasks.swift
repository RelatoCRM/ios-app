//
//  Tasks.swift
//  Relato
//
//  Created by Diego Herrera Redondo on 12/11/24.
//

import Foundation
import SwiftUI

struct TasksDashboardView: View {
    @State private var tasks: [Task] = [
        Task(id: "1", title: "Prepare Presentation", dueDate: "Oct 10"),
        Task(id: "2", title: "Client Meeting", dueDate: "Oct 12"),
        Task(id: "3", title: "Update Website", dueDate: "Oct 15")
    ]
    @State private var showNewTaskSheet = false

    var body: some View {
        List(tasks) { task in
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                Text("Due: \(task.dueDate)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Tasks Dashboard")
        .overlay(
            Button(action: {
                showNewTaskSheet = true
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color("AccentColor"))
                    .clipShape(Circle())
                    .padding()
            }
            .sheet(isPresented: $showNewTaskSheet) {
                NewTaskView()
            },
            alignment: .bottomTrailing
        )
    }
}

struct UpcomingTasksView: View {
    @State private var tasks: [Task] = [
        Task(id: "4", title: "Send Invoice", dueDate: "Oct 20"),
        Task(id: "5", title: "Plan Event", dueDate: "Oct 25"),
        Task(id: "6", title: "Team Meeting", dueDate: "Oct 28")
    ]
    @State private var showNewTaskSheet = false

    var body: some View {
        List(tasks) { task in
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                Text("Due: \(task.dueDate)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Upcoming Tasks")
        .overlay(
            Button(action: {
                showNewTaskSheet = true
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color("AccentColor"))
                    .clipShape(Circle())
                    .padding()
            }
            .sheet(isPresented: $showNewTaskSheet) {
                NewTaskView()
            },
            alignment: .bottomTrailing
        )
    }
}

struct CompletedTasksView: View {
    @State private var tasks: [Task] = [
        Task(id: "7", title: "Finalize Report", dueDate: "Completed on Oct 1"),
        Task(id: "8", title: "Update CRM", dueDate: "Completed on Oct 3"),
        Task(id: "9", title: "Email Campaign", dueDate: "Completed on Oct 5")
    ]
    @State private var showNewTaskSheet = false

    var body: some View {
        List(tasks) { task in
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                Text(task.dueDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Completed Tasks")
    }
}
