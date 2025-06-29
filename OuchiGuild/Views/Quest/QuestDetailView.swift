//
//  QuestDetailView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI

struct QuestDetailView: View {
    var quest: Quest
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var questProgress: QuestProgress = .notStarted
    @State private var isShowDeleteAlert = false
    
    private func handleAppear() {
        questProgress = quest.progress
    }
    
    private func handleQuestProgressChanged() {
        quest.progress = questProgress
        try? modelContext.save()
    }
    
    private func deleteQuest() {
        modelContext.delete(quest)
        try? modelContext.save()
        dismiss()
    }
    
    private func showDeleteAlert() {
        isShowDeleteAlert = true
    }
    
    private func handleProgressChanged() {
        guard let user = quest.user else { return }
        if quest.progress == .completed {
            TransactionService.shared.payQuestReward(to: user,
                                                     amount: quest.reward,
                                                     questID: quest.id,
                                                     in: modelContext)
        }
    }
    
    var body: some View {
        Form {
            Text(quest.title)
            Text(quest.note)
            Picker("Progress", selection: $questProgress) {
                ForEach(QuestProgress.allCases) { progress in
                    Text(progress.title)
                }
            }
        }
        .onChange(of: quest.progress, handleProgressChanged)
        .alert("削除しますか？", isPresented: $isShowDeleteAlert, actions: {
            VStack {
                Button("キャンセル", role: .cancel) {
                }
                Button(role: .destructive, action: deleteQuest) {
                    Text("削除")
                }
            }
        })
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: showDeleteAlert) {
                    Image(systemName: "trash.slash.circle.fill")
                        .tint(Color.red)
                }
            }
        }
        .onAppear(perform: handleAppear)
        .onChange(of: questProgress, handleQuestProgressChanged)
    }
}

#Preview {
    NavigationStack {
        QuestDetailView(quest: Quest(title: "sample", note: "", reward: 100, template: nil, user: nil))
    }
}
