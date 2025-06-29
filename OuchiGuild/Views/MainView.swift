//
//  MainView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        Text("Hello, World!")
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            Tab("User", systemImage: "person.crop.circle") {
                HomeView()
            }
        }
    }
}

#Preview {
    MainView()
}
