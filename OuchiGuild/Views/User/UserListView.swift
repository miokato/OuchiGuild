//
//  UserListView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI
import SwiftData

struct UserListView: View {
    @State private var isShowAdminView = false
    @Query(sort: \Quest.createdAt, order: .forward) private var quests: [Quest]
    @Query(sort: \User.createdAt, order: .reverse) private var users: [User]
    @State private var selectedUser: User?
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink {
                    UserDetailView(user: user)
                } label: {
                    Text(user.name)
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
    UserListView()
        .modelContainer(previewContainer)
}
