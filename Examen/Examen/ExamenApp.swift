//
//  ExamenApp.swift
//  Examen
//
//  Created by epismac on 21/10/24.
//

import SwiftUI
import SwiftData

@main
struct ExamenApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            FoodListView	()
        }
        .modelContainer(sharedModelContainer)
    }
}
