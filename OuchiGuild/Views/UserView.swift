//
//  UserView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI
import SwiftData

struct UserView: View {
    @State private var isShowAdminView = false
    @Query private var quests: [Quest]
    @Query(sort: \User.createdAt, order: .reverse) private var users: [User]
    @State private var selectedUser: User?
    
    private var filteredQuests: [Quest] {
        guard let user = selectedUser else { return quests }
        return quests.filter { $0.userId == user.id }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        Picker("ユーザーを選択", selection: $selectedUser) {
                            ForEach(users) { user in
                                Text(user.name)
                                    .tag(user.id)
                            }
                        }
                    } header: {
                        Text("ユーザー")
                    }
                    Section {
                        List(filteredQuests) { quest in
                            Text(quest.cellDisplayText)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Admin") {
                        isShowAdminView = true
                    }
                }
            }
            .fullScreenCover(isPresented: $isShowAdminView) {
                AdminView()
            }
        }
    }
}

#Preview {
    UserView()
        .modelContainer(previewContainer)
}
