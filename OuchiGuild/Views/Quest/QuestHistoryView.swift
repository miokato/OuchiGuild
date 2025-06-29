//
//  QuestHistoryView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI

struct QuestHistoryView: View {
    var quests: [Quest]
    
    var body: some View {
        List(quests) { quest in
            NavigationLink {
                QuestDetailView(quest: quest)
            } label: {
                if quest.progress == .completed {
                    Label(quest.cellDisplayText, systemImage: "checkmark.circle")
                } else {
                    Text(quest.cellDisplayText)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        QuestHistoryView(quests: [
            .init(title: "sample", note: "", reward: 100, template: nil, user: nil)
            
        ])
    }
}
