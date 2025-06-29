//
//  AdminView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI
import SwiftData

struct AdminView: View {
    @Query(sort: \User.createdAt, order: .reverse) private var users: [User]
    @Environment(\.dismiss) private var dismiss
    @State private var isShowAddUserView = false
    
    private func handleButtonTapped() {
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(users, id: \.id) { user in
                    Text(user.name)
                }
                Button(action: handleButtonTapped) {
                    Text("完了")
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .sheet(isPresented: $isShowAddUserView, content: {
                AddUserView()
                    .presentationDetents([.medium])
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowAddUserView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    AdminView()
        .modelContainer(previewContainer)
}
