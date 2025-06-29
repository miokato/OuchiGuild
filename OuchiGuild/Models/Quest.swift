//
//  Quest.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import Foundation
import SwiftData

@Model
final class Quest: Identifiable {
    @Attribute(.unique) var id: UUID
    var template: QuestTemplate?
    var title: String
    var note: String
    var reward: Int
    var createdAt: Date
    var user: User?
    var progress: QuestProgress
    
    init(title: String, note: String, reward: Int, template: QuestTemplate?, user: User?) {
        self.id = UUID()
        self.createdAt = Date()
        self.title = title
        self.note = note
        self.reward = reward
        self.template = template
        self.user = user
        self.progress = .notStarted
    }
}

extension Quest {
    var cellDisplayText: String {
        "\(title), ユーザー : \(user?.name ?? "不明")"
    }
}
