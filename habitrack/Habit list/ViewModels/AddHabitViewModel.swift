//
//  AddHabitViewModel.swift
//  habitrack
//
//  Created by Omar on 31.07.25.
//

import Foundation

class AddHabitViewModel : ObservableObject
{
    @Published var emoji: String = ""
    @Published var title: String = ""
    @Published var descripton: String = ""
    @Published var error: String = ""
    
    func addHabit() ->Bool
    {
        if(validateHabit())
        {
            error=""
            HabitService.shared.addHabit(Habit(
                id: UUID().uuidString,
                emoji: emoji,
                title: title,
                description: descripton,
                streak: 0))
            eraseTextField()
        }
        
        else
        {
            error="Fill all the fields before adding a habit"
            return false
        }
        
        return true
    }
    
    func validateHabit() -> Bool
    {
        return emoji.count>0 && title.count>1 && descripton.count>1
    }
    
    func eraseTextField()
    {
        emoji=""
        title=""
        descripton=""
    }
}
