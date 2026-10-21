//
//  HabitListViewModel.swift
//  habitrack
//
//  Created by Omar on 30.07.25.
//

import Foundation
import Combine

class HabitListViewModel: ObservableObject
{
    @Published var globalStreak: Int = 0
    @Published var habits = [Habit]()
    @Published var dateString: String=""
    
    let UIChange = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    init()
    {
        refresHabits()
        refreshGlobalStreak()
        dateString = upDate()
        
        // Event handler
        HabitService.shared.habitServiceChanged
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] _ in
                self?.refresHabits()
                self?.refreshGlobalStreak()
            }
            .store(in: &cancellables)
        
        if(habits.count==0)
        {
            HabitService.shared.resetGlobalStreak()
        }
    }
    
    func upDate()->String
    {
        let today=Date()
        
        let formatter=DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .long
        return formatter.string(from: today)
    }
    
    func onAddHabitDismissed()
    {
        refresHabits()
        
    }
    
    func refresHabits()
    {
        habits = HabitService.shared.retrieveHabits()
        UIChange.send()
    }
    
    func refreshGlobalStreak()
    {
        globalStreak = HabitService.shared.globalStreak
        UIChange.send()
    }
    
}
