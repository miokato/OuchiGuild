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
            Quest.self,
            User.self,
        ])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        var container = try ModelContainer(for: schema, configurations: config)
        
        let qt1 = QuestTemplate(title: "お風呂掃除", note: "お風呂掃除をします", reward: 100)
        let qt2 = QuestTemplate(title: "お庭の草抜き", note: "草を抜きます", reward: 50)
        container.mainContext.insert(qt1)
        container.mainContext.insert(qt2)
        
        let u1 = User(name: "はじめ")
        let u2 = User(name: "あっとー")
        let u3 = User(name: "おかC")
        let u4 = User(name: "ちゃちゃ")
        container.mainContext.insert(u1)
        container.mainContext.insert(u2)
        container.mainContext.insert(u3)
        container.mainContext.insert(u4)
        
        let q1 = Quest(title: qt1.title, note: qt1.note, reward: qt1.reward, template: qt1, user: u1)
        let q2 = Quest(title: qt2.title, note: qt2.note, reward: qt2.reward, template: qt2, user: u1)
        let q3 = Quest(title: qt1.title, note: qt1.note, reward: qt1.reward, template: qt1, user: u4)
        container.mainContext.insert(q1)
        container.mainContext.insert(q2)
        container.mainContext.insert(q3)
        
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
