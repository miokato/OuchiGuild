//
//  QuestTemplate.swift
//  OuchiGuild
//
//  Created by mio kato on 2025/06/29.
//

import Foundation
import SwiftData

@Model
final class QuestTemplate: Identifiable {
    @Attribute(.unique) var id: UUID
    var title: String
    var note: String
    var reward: Int
    var createdAt: Date
    @Relationship(deleteRule: .nullify, inverse: \Quest.template) var quests: [Quest]
    
    init(title: String, note: String, reward: Int) {
        self.id = UUID()
        self.title = title
        self.note = note
        self.reward = reward
        self.createdAt = Date()
        self.quests = []
    }
}

extension QuestTemplate {
    var cellDisplayText: String {
        "\(title) 報酬 : \(reward) アジー"
    }
}
