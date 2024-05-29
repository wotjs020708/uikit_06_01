//
//  JournalListView.swift
//  JRNLSwiftUI
//
//  Created by 어재선 on 5/28/24.
//

import SwiftUI
import SwiftData

struct JournalListView: View {
    @State private var isShowAddJournalView = false
    @Query(sort: \JournalEntry.date) var journalEntries: [JournalEntry]
    var body: some View {
        NavigationStack {
            List(journalEntries) { journalEntry in
                Text(journalEntry.entryTitle)
            }
            .navigationTitle("Journal List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        isShowAddJournalView.toggle()
                        print("button")
                    }
                    
                }
            }
            .sheet(isPresented: $isShowAddJournalView) {
                AddJournalEntryView()
            }
        }
    }
}

#Preview {
    JournalListView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
