//
//  QuestTemplateDetailView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI
import SwiftData

struct QuestTemplateDetailView: View {
    var questTemplate:  QuestTemplate
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var users: [User]
    @State private var selectedUser: User?
    
    private var isValid: Bool {
        selectedUser != nil
    }
    
    private func handleButtonTapped() {
        guard let selectedUser = selectedUser else { return }
        let quest = Quest(title: questTemplate.title,
                          note: questTemplate.note,
                          reward: questTemplate.reward,
                          template: questTemplate,
                          user: selectedUser)
        modelContext.insert(quest)
        try? modelContext.save()
        dismiss()
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text(questTemplate.title)
                    Text(questTemplate.note)
                    Text("\(questTemplate.reward) アジー")
                } header: {
                    Text("クエスト")
                }
                Section {
                    Picker("ユーザーを選択", selection: $selectedUser) {
                        ForEach(users) { user in
                            Text(user.name)
                                .tag(user)
                        }
                    }
                } header: {
                    Text("ユーザー")
                }
            }
            Button("このクエストを始める", action: handleButtonTapped)
                .buttonStyle(.borderedProminent)
                .padding()
                .disabled(!isValid)
        }
    }
}

#Preview {
    QuestTemplateDetailView(questTemplate: .init(title: "お庭掃除", note: "お庭掃除します", reward: 100))
        .modelContainer(previewContainer)
}
