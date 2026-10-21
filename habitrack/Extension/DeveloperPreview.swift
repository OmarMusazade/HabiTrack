//
//  DeveloperPreview.swift
//  habitrack
//
//  Created by Omar on 30.07.25.
//

import Foundation

class DeveloperPreview
{
   //MARK: Habits
    static var habits: [Habit] = [
        .init(
            id: NSUUID().uuidString,
            emoji: "🧑‍💻",
            title: "Code",
            description: "Write some code",
            streak: 0
        ),
        .init(
            id: NSUUID().uuidString,
            emoji: "🪥",
            title: "Brush your teeth",
            description: "Brush your teeth twice a day",
            streak: 0
        ),
        .init(
            id: NSUUID().uuidString,
            emoji: "👽",
            title: "Fast",
            description: "It will make you better",
            streak: 0
        )
    ]
    
}
