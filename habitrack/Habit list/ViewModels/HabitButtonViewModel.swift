//
//  HabitButtonViewModel.swift
//  habitrack
//
//  Created by Omar on 30.07.25.
//

import Foundation

class HabitButtonViewModel: ObservableObject
{
    @Published var habit: Habit
    
    @Published var isDeleted: Bool = false
    
    
    init(habit: Habit)
    {
        self.habit = habit
        validateStreak()
    }
}
// -MARK: Delete
extension HabitButtonViewModel
{
    func deleteHabit()
    {
        HabitService.shared.deleteHabits(habit)
        isDeleted = true
    }
}

// -MARK: Streak
extension HabitButtonViewModel
{
    func buttonChecked()
    {
        if(!isLastDateOfStreakToday())
        {
            increaseStreak()
            updateGlobalStreak()
        }
    }
    
    func updateGlobalStreak()
    {
        var allHabitsAreDone = true
        
        for h in HabitService.shared.retrieveHabits()
        {
            if !isLastDateOfStreakToday(date: h.lastDateChecked, isButtonHabit: false)
            {
                allHabitsAreDone = false
            }
        }
        
        if(allHabitsAreDone)
        {
            HabitService.shared.increaseGlobalStreak()
        }
        
    }
    
    func increaseStreak()
    {
        habit.lastDateChecked = Date()
        habit.streak += 1
        HabitService.shared.updateStreak(forHabit: habit)
    }
    
    func validateStreak()
    {
        guard let lastDateChecked=habit.lastDateChecked else { return }
        
        let calendar=Calendar(identifier: .iso8601)
        
        if(calendar.numberOfDaysBetween(lastDateChecked, and: Date())>2)
        {
            habit.streak=0
            HabitService.shared.updateStreak(forHabit: habit)
        }
    }
    
    func isLastDateOfStreakToday(date: Date? = nil, isButtonHabit: Bool = true)->Bool
    {
        let formatter=DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .short
        
        let today=formatter.string(from: Date())
        
        var dateToCompare = ""
        
        if(isButtonHabit && habit.lastDateChecked != nil)
        {
            dateToCompare = formatter.string(from: habit.lastDateChecked!)
        }
        
        else if (!isButtonHabit && date != nil)
        {
            dateToCompare = formatter.string(from: date!)
        }
        return today==dateToCompare
    }
    
}
