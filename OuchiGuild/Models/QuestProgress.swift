//
//  QuestProgress.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

enum QuestProgress: Sendable, Codable, CaseIterable, Identifiable {
    case notStarted
    case started
    case completed
}

extension QuestProgress {
    var id: Self { self }
    var title: String {
        switch self {
        case .notStarted:
            return "開始前"
        case .started:
            return "進行中"
        case .completed:
            return "完了"
        }
    }
}
