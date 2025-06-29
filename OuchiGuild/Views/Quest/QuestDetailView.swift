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
    @State private var questProgress: QuestProgress = .notStarted
    
    private func handleAppear() {
        questProgress = quest.progress
    }
    
    private func handleQuestProgressChanged() {
        quest.progress = questProgress
        try? modelContext.save()
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
        .onAppear(perform: handleAppear)
        .onChange(of: questProgress, handleQuestProgressChanged)
    }
}

#Preview {
    QuestDetailView(quest: Quest(title: "sample", note: "", reward: 100, template: nil, user: nil))
}
