//
//  AddQuestTemplateView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI

struct AddQuestTemplateView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    @State private var note = ""
    @State private var rewared = 50
    @FocusState private var focusState
    
    private var isValid: Bool {
        !title.isEmpty
    }
    
    private func handleButtonTapped() {
        let questTemplate = QuestTemplate(
            title: title,
            note: note,
            reward: rewared
        )
        modelContext.insert(questTemplate)
        try? modelContext.save()
        dismiss()
    }
    
    var body: some View {
        VStack {
            Form {
                titleView
                noteView
                rewardView
            }
            Button(action: handleButtonTapped) {
                Text("作成")
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .disabled(!isValid)
        }
    }
    
    @ViewBuilder
    private var titleView: some View {
        VStack(alignment: .leading) {
            Text("タイトル")
                .font(.caption)
            TextField(
                "title",
                text: $title,
                prompt: Text("(例) お庭掃除")
            )
            .textFieldStyle(.roundedBorder)
            .focused($focusState)
        }
    }
    
    @ViewBuilder
    private var noteView: some View {
        VStack(alignment: .leading) {
            Text("ノート")
                .font(.caption)
            TextField(
                "note",
                text: $note,
                prompt: Text("(例) お庭の掃除をします")
            )
            .textFieldStyle(.roundedBorder)
            .focused($focusState)
        }
    }
    
    @ViewBuilder
    private var rewardView: some View {
        VStack(alignment: .leading) {
            Text("報酬(ほうしゅう)")
                .font(.caption)
            Stepper(
                value: $rewared,
                in: 50...500,
                step: 50
            ) {
                Text("\(rewared) アジー")
            }
        }
    }
}

#Preview {
    AddQuestTemplateView()
}
