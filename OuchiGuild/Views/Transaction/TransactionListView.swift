//
//  TransactionListView.swift
//  OuchiGuild
//
//  Created by mio-kato on 2025/06/29.
//

import SwiftUI
import SwiftData

struct TransactionListView: View {
    @Query private var transferRecords: [TransferRecord]
    
    var body: some View {
        List(transferRecords) { record in
            ScrollView(.vertical) {
                Text(record.preview)
            }
        }
    }
}

#Preview {
    TransactionListView()
        .modelContainer(previewContainer)
}
