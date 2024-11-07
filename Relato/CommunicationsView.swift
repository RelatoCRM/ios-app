import SwiftUI
import PhotosUI
import UniformTypeIdentifiers

// Vista principal de las comunicaciones
struct CommunicationsView: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: String? = nil
    @State private var showNewCommunicationSheet = false
    
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
        Communication(subject: "Q4 Keynote Reminder", communicationBody: "JSDJASJ", sendingGroup: "Investors Newsletter", campaign: "Reminders", future: false),
        Communication(subject: "Product Tips", communicationBody: "JASJASJJS", sendingGroup: "Tips Newsletter", campaign: "Products", future: false),
        Communication(subject: "Weekly Update", communicationBody: "JSJAJSJAS", sendingGroup: "Weekly Digest", campaign: "Announcements", future: false),
        Communication(subject: "Project Deadline", communicationBody: "JSJSJJS", sendingGroup: "Reminders & Deadlines", campaign: "Ticketing", future: false)
    ]
        
    // Filtrado de comunicaciones por búsqueda y categoría
    var filteredCommunications: [Communication] {
        var filtered = communications
        if let campaign = selectedCategory, campaign != "All" {
            filtered = filtered.filter { $0.campaign == campaign }
        }
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
                HStack {
                    VStack(alignment: .leading) {
                        Text("Welcome to")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Communications")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Manolo Ruíz")
                            .font(.headline)
                    }
                    .padding()
                    
                    Spacer() // Pushes the text and icon apart
                    
                    VStack(alignment: .trailing) {
                        Image(systemName: "tray.2.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 70, maxHeight: 60)
                            .padding(.horizontal, 20)
                    }
                }
                                
                VStack {
                    // Barra de búsqueda
                    TextField("Search communications...", text: $searchText)
                        .padding(10)
                        .background(Color(.secondarySystemFill))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    // Scroll horizontal para categorías
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(availableCategories) { category in
                                Button {
                                    selectedCategory = category.name
                                } label: {
                                    Text(category.name)
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(selectedCategory == category.name ? Color("LighterAccentColor") : Color("AccentColor"))
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
                
                // Lista de resultados
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(filteredCommunications) { communication in
                            NavigationLink(destination: CommunicationDetailView(communication: communication)) {
                                HStack {
                                    // Icono
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .padding(.trailing, 8)
                                    
                                    // Detalles de la comunicación
                                    VStack(alignment: .leading) {
                                        Text(communication.subject)
                                            .font(.headline)
                                            .foregroundStyle(Color.primary)
                                        Text(communication.sendingGroup)
                                            .font(.subheadline)
                                            .foregroundStyle(Color.primary)
                                    }
                                    
                                    Spacer()
                                    
                                    // Flecha de navegación
                                    Image(systemName: "arrow.right")
                                }
                                .padding(.horizontal)
                            }
                            Divider()
                        }
                    }
                    .padding(.top, 10)
                }
                .background(Color("BackgroundColor"))
                .overlay(
                                // Sticky circular button in the bottom-right corner
                                Button(action: {
                                    showNewCommunicationSheet = true // Trigger the sheet
                                }) {
                                    Image(systemName: "plus")
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)
                                        .frame(width: 60, height: 60)
                                        .background(Color("AccentColor"))
                                        .clipShape(Circle())
                                        .padding()
                                }
                                .sheet(isPresented: $showNewCommunicationSheet) {
                                    NewCommunicationView() // Sheet content for creating new communication
                                },
                                alignment: .bottomTrailing // Align it to bottom-right
                            )
            }
            .background(Color("BackgroundColor"))
        }
    }
}

// Vista detallada para cada comunicación
struct CommunicationDetailView: View {
    var communication: Communication
    @State private var communicationTitle = ""
    @State private var campaign = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                // Communication Title
                HStack {
                    Text(communication.subject)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal, 4)
                        .padding(.vertical)
                }
                .padding(.horizontal, 20) // Compact padding
                
                Divider()
                
                // Campaign Picker
                HStack {
                    Text("Campaign: ")
                        .font(.headline)
                    Text(communication.campaign)
                    .frame(height: 32)
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal, 4)
                }
                .padding(.horizontal, 20)

                Divider() // Divider between sections
                
                // Sending Group Picker
                HStack {
                    Text("Sending Group: ")
                        .font(.headline)
                    Text(communication.sendingGroup)
                    .frame(height: 32)
                    .padding(.horizontal, 4)
                }
                .padding(.horizontal, 20)
                
                Divider()
                
                // Email content text editor (big text editor)
                VStack(alignment: .leading) {
                    Text(communication.communicationBody)
                    .padding(.horizontal, 4)
                }
                .padding(.horizontal, 8)
                
                Spacer()
            }
        }
        .navigationTitle("Communication #\(10)")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("BackgroundColor"))
    }
}

// View for Future Communications
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

// View for creating a new communication
struct NewCommunicationView: View {
    @Environment(\.dismiss) var dismiss // To close the sheet
    @FocusState private var emailFieldIsFocused: Bool // Use FocusState for managing the focus
    
    // Example data
    var sendingGroups = ["All Users", "Featured Leads", "Investors", "Tartan"]
    var campaigns = ["No Campaign", "Spring Sale", "Product Launch", "Customer Feedback", "Q4 Updates", "Holiday Promotions"]
    
    @State private var communicationTitle = ""
    @State private var selectedGroup = ""
    @State private var selectedCampaign = ""
    @State private var commContent = ""
    
    @State private var showScheduleSheet = false
    @State private var showCancelAlert = false
    @State private var showMissingFieldAlert = false
    @State private var showMissingOption = false
    
    @State private var scheduledDate = Date()
    @State private var showSuccessMessage = false
    @State private var successMessage = ""
    
    // Track text styles
    @State private var isBold = false
    @State private var isItalic = false
    @State private var isUnderline = false
    
    @State private var showImagePicker = false
    @State private var showFilePicker = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                // Communication Title
                HStack {
                    Text("Subject: ")
                        .font(.headline)
                    TextField("Type in the subject", text: $communicationTitle)
                        .frame(height: 32) // Adjust height for compact design
                        .padding(.horizontal, 4) // Reduce padding
                }
                .padding(.horizontal, 20) // Compact padding
                
                Divider()
                
                // Campaign Picker
                HStack {
                    Text("Campaign: ")
                        .font(.headline)
                    Picker("", selection: $selectedCampaign) {
                        ForEach(campaigns, id: \.self) {
                            Text($0)
                        }
                    }
                    .frame(height: 32)
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal, 4)
                }
                .padding(.horizontal, 20)

                Divider() // Divider between sections
                
                // Sending Group Picker
                HStack {
                    Text("Sending Group: ")
                        .font(.headline)
                    Picker("", selection: $selectedGroup) {
                        ForEach(sendingGroups, id: \.self) {
                            Text($0)
                        }
                    }
                    .frame(height: 32)
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal, 4)
                }
                .padding(.horizontal, 20)
                
                Divider()
                
                // Email content text editor (big text editor)
                VStack(alignment: .leading) {
                    TextEditor(text: $commContent)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal, 4)
                        .cornerRadius(8)
                        .font(getFont()) // Apply font based on toggled styles
                }
                .padding(.horizontal, 8)
                
                Spacer()
            }
            .padding(.top)
            .navigationTitle("New Communication")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showCancelAlert = true
                    }
                    .alert(isPresented: $showCancelAlert) {
                        Alert(
                            title: Text("Cancel Communication"),
                            message: Text("Are you sure you want to cancel? All data will be erased."),
                            primaryButton: .destructive(Text("Cancel")) {
                                dismiss()
                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Schedule") {
                        if communicationTitle.isEmpty || selectedGroup.isEmpty || commContent.isEmpty {
                            showMissingFieldAlert = true
                        } else {
                            showScheduleSheet = true
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Send") {
                        if communicationTitle.isEmpty || selectedGroup.isEmpty || commContent.isEmpty {
                            showMissingFieldAlert = true
                        } else {
                            successMessage = "The communication has been sent!"
                            showSuccessMessage = true
                        }
                    }
                }
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        // Add Files Button
                        Button(action: {
                            showFilePicker = true
                        }) {
                            Image(systemName: "doc")
                        }
                        .cornerRadius(10)

                        // Add Image Button
                        Button(action: {
                            showImagePicker = true
                        }) {
                            Image(systemName: "photo.on.rectangle")
                        }
                        .cornerRadius(10)

                        Divider()

                        // Bold Button
                        Button(action: {
                            isBold.toggle() // Toggle bold style
                        }) {
                            Text("B").bold() // Bold symbol
                        }
                        .cornerRadius(10)
                        .background(isBold ? Color.gray.opacity(0.2) : Color.clear)

                        // Italic Button
                        Button(action: {
                            isItalic.toggle() // Toggle italic style
                        }) {
                            Text("I").italic() // Italic symbol
                        }
                        .cornerRadius(10)
                        .background(isItalic ? Color.gray.opacity(0.2) : Color.clear)

                        // Underline Button
                        Button(action: {
                            isUnderline.toggle() // Toggle underline style
                        }) {
                            Text("U").underline() // Underline symbol
                        }
                        .cornerRadius(10)
                        .background(isUnderline ? Color.gray.opacity(0.2) : Color.clear)
                    }
                }
            }
            .sheet(isPresented: $showScheduleSheet) {
                ScheduleSheet(
                    scheduledDate: $scheduledDate,
                    onSchedule: {
                        successMessage = "The communication has been scheduled!"
                        showSuccessMessage = true
                        dismiss()
                    }
                )
            }
            .alert(isPresented: $showSuccessMessage) {
                Alert(title: Text("Success"), message: Text(successMessage), dismissButton: .default(Text("OK")))
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker() // Present image picker
            }
            .sheet(isPresented: $showFilePicker) {
                FilePicker() // Present file picker
            }
        }
        .tint(Color("AccentColor"))
    }
    
    // Helper function to return the correct font based on toggled styles
    func getFont() -> Font {
        var font: Font = .body
        if isBold { font = font.weight(.bold) }
        if isItalic { font = font.italic() }
        return font
    }
}

// ImagePicker and FilePicker implementation
struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images // Only allow images
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
}

struct FilePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.content])
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
}

struct ScheduleSheet: View {
    @Binding var scheduledDate: Date
    var onSchedule: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Select Date & Time", selection: $scheduledDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                
                Spacer()
                
                Button(action: {
                    onSchedule()
                }) {
                    Text("Schedule")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color("AccentColor"))
                        .cornerRadius(10)
                        .padding()
                }
            }
            .navigationTitle("Schedule")
        }
    }
}

// Preview
struct CommunicationsView_Previews: PreviewProvider {
    static var previews: some View {
        CommunicationsView()
    }
}
