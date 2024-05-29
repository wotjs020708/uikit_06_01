//
//  AddJournalEntryView.swift
//  JRNLSwiftUI
//
//  Created by 어재선 on 5/28/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: index < rating ? "star.fill" : "star")
                    .foregroundStyle(.blue)
                    .onTapGesture {
                        rating = index + 1
                    }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct AddJournalEntryView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var rating = 0
    @State private var isGetLocationOn = false
    @State private var entryTitle = ""
    @State private var entryBody = ""
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Rating")){
                    RatingView(rating: $rating)
                }
                Section(header: Text("Location")) {
                    Toggle("Get Location", isOn: $isGetLocationOn)
                }
                Section(header: Text("Title")) {
                    TextField("Enter Title", text: $entryTitle)
                }
                Section(header: Text("Body")) {
                    TextEditor(text: $entryBody)
                }
                Section(header: Text("Photo")){
                    
                }
            }
            .navigationTitle("Add Journal Entry")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        dismiss()
                        let journalEntry = JournalEntry(rating: 3, entryTitle: entryTitle, entryBody: entryBody, latiude: nil, longitude: nil)
                        modelContext.insert(journalEntry)
                    }
                }
            }
        }
    }
}

#Preview {
    AddJournalEntryView()
}
