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
    var accountRole: AccountRole = AccountRole.member
    
    init(name: String) {
        self.id = UUID()
        self.createdAt = Date()
        self.name = name
        self.quests = []
    }
}

extension User {
    func balance(in context: ModelContext) throws -> Int {
        // ① 自分が受け取った金額
        let targetId = self.id
        let plus = try context.fetch(
            FetchDescriptor<TransferRecord>(predicate: #Predicate { $0.to?.id == targetId })
        ).map(\.amount).reduce(0, +)

        // ② 自分が支払った金額
        let minus = try context.fetch(
            FetchDescriptor<TransferRecord>(predicate: #Predicate { $0.from?.id == targetId })
        ).map(\.amount).reduce(0, +)

        return plus - minus
    }
}
