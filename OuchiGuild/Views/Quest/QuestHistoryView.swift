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
            NavigationLink(quest.cellDisplayText) {
                QuestDetailView(quest: quest)
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
