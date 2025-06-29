//
//  QuestListView.swift
//  OuchiGuild
//
//  Created by mio kato on 2025/06/29.
//

import SwiftUI
import SwiftData

struct QuestListView: View {
    @Query(sort: \QuestTemplate.createdAt, order: .reverse) private var questTemplates: [QuestTemplate]
    @State private var isShowAddQuestTemplateView = false
    
    var body: some View {
        NavigationStack {
            List(questTemplates, id: \.id) { template in
                NavigationLink(template.cellDisplayText) {
                    QuestTemplateDetailView(questTemplate: template)
                }
            }
            .sheet(isPresented: $isShowAddQuestTemplateView, content: {
                AddQuestTemplateView()
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowAddQuestTemplateView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    QuestListView()
        .modelContainer(previewContainer)
}
