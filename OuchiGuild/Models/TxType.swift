//
//  TxType.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

enum TxType: String, Codable, CaseIterable {
    case issue
    case transfer
    case quest
    case tax
    case penalty
}
