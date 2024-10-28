import SwiftUI

struct ManagementView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Welcome message
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Welcome to")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("Management")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Manolo Ruíz")
                                .font(.headline)
                        }
                        .padding()
                        
                        Spacer() // Pushes the text and icon apart
                        
                        VStack(alignment: .trailing) {
                            Image(systemName: "mail.and.text.magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 70, maxHeight: 70)
                                .padding(.horizontal, 20)
                        }
                    }

                    // KPIs Section (Quick Overview of Key Metrics)
                    Text("Key Performance Indicators (KPIs)")
                        .font(.headline)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            KPIView(title: "Total Sales", value: "$200K")
                            KPIView(title: "Conversion Rate", value: "15%")
                            KPIView(title: "Lead Response", value: "2h")
                            KPIView(title: "Customer LTV", value: "$2K")
                        }
                        .padding(15)
                    }
                    
                    // Campaigns & Target Groups Section
                    Text("Campaigns & Sending Groups")
                        .font(.headline)
                        .padding([.top, .horizontal])

                    VStack(spacing: 16) {
                        NavigationLink(destination: NotificationsView()) {
                            ManagementTileView(title: "All Campaigns", icon: "mail.stack.fill")
                        }
                        NavigationLink(destination: NotificationsView()) {
                            ManagementTileView(title: "Inactive Campaigns", icon: "mail.stack")
                        }
                        NavigationLink(destination: CustomerFeedbackView()) {
                            ManagementTileView(title: "Sending Groups", icon: "person.3.sequence.fill")
                                .padding(.bottom, 15)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Leads/Customer Insights Management Section
                    Text("Leads & Customer Insights")
                        .font(.headline)
                        .padding(.horizontal)

                    VStack(spacing: 16) {
                        NavigationLink(destination: LeadsView()) {
                            ManagementTileView(title: "Recent Leads", icon: "person.badge.clock.fill")
                        }
                        NavigationLink(destination: LeadsView()) {
                            ManagementTileView(title: "High Priority Leads", icon: "person.3.fill")
                        }
                        NavigationLink(destination: SupportTeamView()) {
                            ManagementTileView(title: "Customer Segment Insights", icon: "chart.pie.fill").padding(.bottom, 15)

                        }
                    }
                    .padding(.horizontal)
                    
                    // Automation Section
                    Text("Automations & Notifications")
                        .font(.headline)
                        .padding(.horizontal)

                    VStack(spacing: 16) {
                        NavigationLink(destination: LeadsView()) {
                            ManagementTileView(title: "All Automations", icon: "command.square.fill")
                        }
                        NavigationLink(destination: LeadsView()) {
                            ManagementTileView(title: "All Notifications", icon: "bell.fill")
                        }
                    }
                    .padding(.horizontal)

                    
                    // Tasks & Activity Section
                    Text("Tasks Overview")
                        .font(.headline)
                        .padding([.top, .horizontal])

                    VStack(spacing: 16) {
                        NavigationLink(destination: TaskView()) {
                            ManagementTileView(title: "Tasks Dashboard", icon: "uiwindow.split.2x1")
                        }
                        NavigationLink(destination: SalesPipelineView()) {
                            ManagementTileView(title: "Upcoming Tasks", icon: "list.bullet.clipboard.fill")
                        }
                        NavigationLink(destination: TaskView()) {
                            ManagementTileView(title: "Completed Tasks", icon: "list.bullet.clipboard")
                        }
                    }
                    .padding(.horizontal)

                    // Reviews/Feedback Section
                    Text("Reviews & Feedback")
                        .font(.headline)
                        .padding([.top, .horizontal])

                    VStack(spacing: 16) {
                        NavigationLink(destination: NotificationsView()) {
                            ManagementTileView(title: "Reviews List", icon: "list.star")
                        }
                        NavigationLink(destination: CustomerFeedbackView()) {
                            ManagementTileView(title: "Reply to Reviews", icon: "bubble.left.and.bubble.right.fill")
                        }
                        NavigationLink(destination: CustomerFeedbackView()) {
                            ManagementTileView(title: "Launch a Survey", icon: "doc.fill.badge.plus")
                        }
                        NavigationLink(destination: CustomerFeedbackView()) {
                            ManagementTileView(title: "Visualize Survey Results", icon: "doc")
                                .padding(.bottom, 15)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            .background(Color("BackgroundColor"))
        }
    }
}

// Example KPI Card for horizontal scroll
struct KPIView: View {
    var title: String
    var value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("AccentColor"))
        }
        .frame(width: 150, height: 100)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct ManagementTileView: View {
    var title: String
    var icon: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 32))  // Mantieni una dimensione uniforme per il font
                .foregroundColor(Color("AccentColor"))
                .frame(width: 40, height: 40).padding(.horizontal)  // Definisci una dimensione fissa per l'icona
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.leading)
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

// Placeholder Views for navigation
struct LeadsView: View {
    var body: some View {
        Text("Manage Leads")
            .navigationTitle("Leads Management")
    }
}

struct SupportTeamView: View {
    var body: some View {
        Text("Support Team Management")
            .navigationTitle("Support Team")
    }
}

struct SalesPipelineView: View {
    var body: some View {
        Text("Sales Pipeline")
            .navigationTitle("Sales Pipeline")
    }
}

struct TaskView: View {
    var body: some View {
        Text("Tasks Overview")
            .navigationTitle("Tasks Overview")
    }
}

struct TeamPerformanceView: View {
    var body: some View {
        Text("Team Performance")
            .navigationTitle("Team Performance")
    }
}

struct NotificationsView: View {
    var body: some View {
        Text("Notifications")
            .navigationTitle("Notifications")
    }
}

struct CustomerFeedbackView: View {
    var body: some View {
        Text("Customer Feedback")
            .navigationTitle("Customer Feedback")
    }
}

// Preview for ManagementView
#Preview {
    ManagementView()
}
