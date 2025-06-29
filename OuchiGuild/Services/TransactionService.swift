//
//  TransactionService.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import Foundation
import SwiftData

@MainActor
final class TransactionService {
    static let shared = TransactionService()
    
    func deposit(to user: User, amount: Int, memo: String = "入金", in context: ModelContext) {
        let tx = TransferRecord(amount: amount, type: .transfer, from: nil, to: user, memo: memo)
        context.insert(tx)
    }

    func withdraw(from user: User, amount: Int, memo: String = "出金", in context: ModelContext) {
        let tx = TransferRecord(amount: amount, type: .transfer, from: user, to: nil, memo: memo)
        context.insert(tx)
    }

    // クエスト完了時の報酬支払い
    func payQuestReward(to user: User, amount: Int, questID: UUID, in context: ModelContext) {
        let tx = TransferRecord(amount: amount, type: .quest, from: nil, to: user, memo: "Quest \(questID)")
        context.insert(tx)
    }
}
