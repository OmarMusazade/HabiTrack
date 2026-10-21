//
//  HabitService.swift
//  habitrack
//
//  Created by Omar on 24.08.25.
//

import Foundation
import SwiftUI
import Combine

class HabitService
{
    @AppStorage("GLOBAL_STREAK_KEY") var globalStreak: Int = 0
    @AppStorage("HABITS_KEY") var savedHabits: Data = Data()
    private var habits: [Habit] = []
    
    let habitServiceChanged = PassthroughSubject<Void, Never>()
    
    static let shared = HabitService()
    
    init ()
    {
        habits = retrieveHabits()
    }
    
}
    
    
// -MARK: Data Conversion
extension HabitService
{
// Save
    func saveHabits()
    {
        // Convert to JSON
        guard let habitsJSON = try? JSONEncoder().encode(habits) else { return }
            self.savedHabits = habitsJSON
        
        habitServiceChanged.send()
    }
        
    // Retrieve
    func retrieveHabits() -> [Habit]
    {
        guard let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits) else { return [] }
            
        return decodedHabits
    }
}
    

// -MARK: Data Queries
extension HabitService
{
    // Add
    func addHabit(_ habit: Habit)
    {
        habits.append(habit)
        saveHabits()
    }
    
    // Delete
    func deleteHabits(_ habit:Habit)
    {
        habits.removeAll(where: { $0.id == habit.id })
        updateGlobalStreak()
        saveHabits()
    }
    
    //Update streak
    func updateStreak(forHabit habit:Habit)
    {
        guard let index=habits.firstIndex(where:
          {$0.id == habit.id }) else { return }
        
        habits[index]=habit
        saveHabits()
    }
     
    func increaseGlobalStreak()
    {
        globalStreak += 1
        habitServiceChanged.send()
    }
    
    func resetGlobalStreak()
    {
        globalStreak = 0
    }
    
    func updateGlobalStreak()
    {
        if(habits.count==0)
        {
            resetGlobalStreak()
        }
    }
    
}
    
