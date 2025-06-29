//
//  User.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import Foundation
import SwiftData

@Model
final class User: Identifiable {
    @Attribute(.unique) var id: UUID
    var createdAt: Date
    var name: String
    @Relationship(deleteRule: .cascade, inverse: \Quest.user)
    var quests: [Quest]
    
    init(name: String) {
        self.id = UUID()
        self.createdAt = Date()
        self.name = name
        self.quests = []
    }
}
