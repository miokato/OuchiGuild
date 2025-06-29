//
//  UserView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI

struct UserView: View {
    @State private var isShowGuildView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Text("UserView")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Admin") {
                        isShowGuildView = true
                    }
                }
            }
            .fullScreenCover(isPresented: $isShowGuildView) {
                GuildView()
            }
        }
    }
}

#Preview {
    UserView()
}
