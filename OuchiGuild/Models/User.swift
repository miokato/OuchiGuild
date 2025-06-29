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
    var id: UUID
    var createdAt: Date
    var name: String
    
    init(name: String) {
        self.id = UUID()
        self.createdAt = Date()
        self.name = name
    }
}
