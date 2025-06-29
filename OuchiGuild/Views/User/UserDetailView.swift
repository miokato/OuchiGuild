//
//  UserDetailView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        Form {
            Section {
                Text(user.name)
            } header: {
                Text("ユーザー情報")
            }
            Section {
                QuestHistoryView(quests: user.quests)
            } header: {
                Text("クエスト一覧")
            }
        }
    }
}

#Preview {
    UserDetailView(user: .init(name: "さんぷるくん"))
        .modelContainer(previewContainer)
}
