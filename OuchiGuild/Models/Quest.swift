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
    var id: UUID
    var templateId: UUID
    var userId: UUID
    var title: String
    var note: String
    var reward: Int
    var createdAt: Date
    
    init(title: String, note: String, reward: Int, templateId: UUID, userId: UUID) {
        self.id = UUID()
        self.createdAt = Date()
        self.title = title
        self.note = note
        self.reward = reward
        self.templateId = templateId
        self.userId = userId
    }
}

extension Quest {
    var cellDisplayText: String {
        "\(title) 報酬 : \(reward) アジー"
    }
}
