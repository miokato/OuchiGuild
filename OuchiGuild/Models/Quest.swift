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
    var templateId: UUID
    var userId: UUID
    var title: String
    var note: String
    var reward: Int
    var createdAt: Date
    var user: User?
    
    init(title: String, note: String, reward: Int, templateId: UUID, userId: UUID, user: User) {
        self.id = UUID()
        self.createdAt = Date()
        self.title = title
        self.note = note
        self.reward = reward
        self.templateId = templateId
        self.userId = userId
        self.user = user
    }
}

extension Quest {
    var cellDisplayText: String {
        "\(title), ユーザー : \(user?.name ?? "不明")"
    }
}
