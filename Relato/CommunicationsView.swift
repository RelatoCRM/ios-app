// New Detail View for Communication

import SwiftUI

// Communications View with Navigation and Filtering by Category
struct CommunicationsView: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: String? = nil // New state for the selected category
    @State private var availableCategories: [Category] = [
        Category(name: "All"),
        Category(name: "Announcements"),
        Category(name: "Ticketing"),
        Category(name: "Reminders"),
        Category(name: "Products")
    ]
    var futureCommunications: [Communication] {
        return communications.filter { $0.future }
    }
    
    @State var communications: [Communication] = [
        Communication(subject: "Q4 Keynote Reminder", sendingGroup: "Investors Newsletter", category: "Reminders", future: false),
        Communication(subject: "Product Tips", sendingGroup: "Tips Newsletter", category: "Products", future: false),
        Communication(subject: "Weekly Update", sendingGroup: "newsletter@example.com", category: "Announcements", future: false),
        Communication(subject: "Project Deadline", sendingGroup: "boss@example.com", category: "Ticketing", future: false)
    ]
        
    // Filter communications by search text and category
    var filteredCommunications: [Communication] {
        var filtered = communications
        
        // Apply category filter if a category is selected and it's not "All"
        if let category = selectedCategory, category != "All" {
            filtered = filtered.filter { $0.category == category }
        }
        
        // Apply search filter
        if !searchText.isEmpty {
            filtered = filtered.filter { communication in
                communication.subject.lowercased().contains(searchText.lowercased()) ||
                communication.sendingGroup.lowercased().contains(searchText.lowercased())
            }
        }
        
        return filtered
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                TextField("Search communications...", text: $searchText)
                    .padding(10)
                    .background(Color(.secondarySystemFill))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .padding(.top)
                
                // Horizontal Scroll for Categories
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(availableCategories) { category in
                            Button {
                                selectedCategory = category.name // Set selected category
                            } label: {
                                Text(category.name)
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(selectedCategory == category.name ? Color("LighterAccentColor") : Color("AccentColor")) // Highlight selected category
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
                
                // Scheduled communications
                if futureCommunications.isEmpty {
                                    NavigationLink(destination: FutureCommunicationsView(communications: futureCommunications)) {
                                        HStack {
                                            Image(systemName: "calendar")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .padding(.horizontal, 8).foregroundStyle(.white)
                                            Text("Scheduled Communications")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                            
                                            // Arrow Image aligned to the right
                                            Image(systemName: "arrow.right")
                                                .foregroundColor(.white)
                                        }
                                        .padding()
                                        .background(Color("AccentColor"))
                                        .cornerRadius(8)
                                        .padding(.horizontal)
                                    }
                                }
                
                // Results
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(filteredCommunications) { communication in
                            // NavigationLink to CommunicationDetailView
                            HStack {
                                // Avatar Image on the leading side
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .foregroundColor(Color("AccentColor"))
                                    .padding(.trailing, 8)
                                
                                // Email details
                                VStack(alignment: .leading) {
                                    Text(communication.subject)
                                        .font(.headline)
                                    Text(communication.sendingGroup)
                                        .font(.subheadline)
                                }
                                
                                Spacer()
                                
                                // Arrow Image aligned to the right
                                Image(systemName: "arrow.right")
                                    .foregroundColor(Color("AccentColor"))
                            }
                            .padding(.horizontal)
                            Divider()
                        }
                    }
                    .padding(.top, 10)
                }
                .background(Color("BackgroundColor"))
            }.background(Color("BackgroundColor"))
        }
    }
}

struct FutureCommunicationsView: View {
    var communications: [Communication]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(communications) { communication in
                    HStack {
                        // Avatar Image
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color("AccentColor"))
                            .padding(.trailing, 8)
                        
                        // Email details
                        VStack(alignment: .leading) {
                            Text(communication.subject)
                                .font(.headline)
                            Text(communication.sendingGroup)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer() // Pushes the arrow to the right
                        
                        // Arrow Image aligned to the right
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color("AccentColor"))
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color("BackgroundColor"))
            .padding(.top, 10)
        }
        .navigationTitle("Scheduled Communications")
        .padding()
        .tint(Color("AccentColor"))
    }
}


// Preview
struct CommunicationsView_Previews: PreviewProvider {
    static var previews: some View {
        CommunicationsView()
    }
}
