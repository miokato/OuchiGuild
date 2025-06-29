//
//  TransferRecord.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import Foundation
import SwiftData

@Model
final class TransferRecord: Identifiable {
    @Attribute(.unique) var id = UUID()
    var createdAt: Date = Date()
    var amount: Int
    var type: TxType
    var from: User?
    var to: User?
    var memo: String?
    
    init(amount: Int, type: TxType, from: User? = nil, to: User? = nil, memo: String? = nil) {
        self.amount = amount
        self.type = type
        self.from = from
        self.to = to
        self.memo = memo
    }
}

extension TransferRecord {
    var preview: String {
        "TYPE:\(type), 金額:\(amount), from:\(from?.name ?? "-"), to:\(to?.name ?? "-")"
    }
}
