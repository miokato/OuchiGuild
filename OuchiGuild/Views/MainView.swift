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
            UserListView()
                .tabItem {
                    Label("ユーザー", systemImage: "person.crop.circle")
                }
            HomeView()
                .tabItem {
                    Label("お仕事", systemImage: "house")
                }
            TransactionListView()
                .tabItem {
                    Label("取引", systemImage: "australsign.bank.building")
                }
        }
    }
}

#Preview {
    MainView()
        .modelContainer(previewContainer)
}
