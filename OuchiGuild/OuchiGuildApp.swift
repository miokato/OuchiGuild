//
//  OuchiGuildApp.swift
//  OuchiGuild
//
//  Created by mio kato on 2025/06/29.
//

import SwiftUI
import SwiftData

@main
struct OuchiGuildApp: App {
    var modelContainer: ModelContainer = {
        let schema = Schema([
            QuestTemplate.self,
            Quest.self,
            User.self
        ])
        let config = ModelConfiguration(cloudKitDatabase: .automatic)
        
        do {
            return try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(modelContainer)
    }
}
