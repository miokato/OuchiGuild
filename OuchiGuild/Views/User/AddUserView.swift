//
//  AddUserView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI

struct AddUserView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var text = ""
    
    private var isValid: Bool {
        !text.isEmpty
    }
    
    private func addUser() {
        let user = User(name: text)
        modelContext.insert(user)
        try? modelContext.save()
        dismiss()
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("ユーザー名", text: $text)
                } header: {
                    Text("ユーザー")
                }
            }
            Button(action: addUser) {
                Text("追加")
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .disabled(!isValid)
        }
    }
}

#Preview {
    AddUserView()
}
