//
//  Quest.swift
//  OuchiGuild
//
//  Created by mio kato on 2025/06/29.
//

import Foundation
import SwiftData

@Model
final class Quest: Identifiable {
    var id: UUID
    var title: String
    var note: String
    var reward: Int
    
    init(title: String, note: String, reward: Int) {
        self.id = UUID()
        self.title = title
        self.note = note
        self.reward = reward
    }
}
