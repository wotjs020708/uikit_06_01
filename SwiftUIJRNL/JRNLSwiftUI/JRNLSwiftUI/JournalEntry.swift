//
//  JournalEntry.swift
//  JRNLSwiftUI
//
//  Created by 어재선 on 5/28/24.
//

import Foundation
import SwiftData


@Model
class JournalEntry {
    let date: Date
    let rating: Int
    let entryTitle: String
    let entryBody: String
    let latiude: Double?
    let longitude: Double?
    
    init(rating: Int, entryTitle: String, entryBody: String, latiude: Double?, longitude: Double?) {
        self.date = Date()
        self.rating = rating
        self.entryTitle = entryTitle
        self.entryBody = entryBody
        self.latiude = latiude
        self.longitude = longitude
    }
}
