//
//  MainView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            UserListView()
                .tabItem {
                    Label("User", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    MainView()
        .modelContainer(previewContainer)
}
