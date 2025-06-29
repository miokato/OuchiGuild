//
//  PreviewSampleData.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let schema = Schema([
            QuestTemplate.self,
        ])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        var container = try ModelContainer(for: schema, configurations: config)
        let q1 = QuestTemplate(title: "お風呂掃除", note: "お風呂掃除をします", reward: 100)
        let q2 = QuestTemplate(title: "お庭の草抜き", note: "草を抜きます", reward: 50)
        container.mainContext.insert(q1)
        container.mainContext.insert(q2)
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
