//
//  JRNLSwiftUIApp.swift
//  JRNLSwiftUI
//
//  Created by 어재선 on 5/28/24.
//

import SwiftUI

@main
struct JRNLSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: JournalEntry.self)
    }
}
