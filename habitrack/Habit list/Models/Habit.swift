//
//  Habit.swift
//  habitrack
//
//  Created by Omar on 30.07.25.
//

import Foundation

struct Habit : Identifiable, Encodable, Decodable
{
    let id: String
    var emoji: String
    var title: String
    var description: String
    var streak: Int
    var lastDateChecked: Date?
}
