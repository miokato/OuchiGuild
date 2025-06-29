//
//  HomeView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        QuestListView()
    }
}

#Preview {
    HomeView()
        .modelContainer(previewContainer)
}
