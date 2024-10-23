import SwiftUI
import SwiftData

@main
struct RelatoApp: App {
    var sharedModelContainer: ModelContainer = {
        do {
            // Crea el contenedor con tus modelos persistentes
            return try ModelContainer(for: Communication.self, Category.self, Review.self)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer) // Asigna el contenedor al contexto de la vista
        }
    }
}
