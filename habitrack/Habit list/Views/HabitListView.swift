//
//  HabitListView.swift
//  habitrack
//
//  Created by Omar on 29.07.25.
//

import SwiftUI

struct HabitListView: View
{
    @StateObject var viewModel = HabitListViewModel()
    @State var showForm: Bool = false
    @State var isEditMode: Bool = false
    
    var body: some View
    {
        ScrollView
        {
            VStack(alignment: .leading, spacing: 30)
            {
                Text("Enjoy the process not the destination!\n")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top,20)
                
                VStack(alignment: .leading, spacing: 5)
                {
                    //Date
                    Text(viewModel.dateString)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.orange)
                    //Streak
                    Text("🔥 \(viewModel.globalStreak)  \(viewModel.globalStreak == 1 ? "day" : "days") streak")
                        .font(.title3)
                        .foregroundStyle(Color(red: 183/255, green: 65/255, blue: 14/255))
                }
                
                //Habit list
                
                //Button
                LazyVStack(spacing: 17.5)
                {
                    ForEach(viewModel.habits)
                    {
                        habit in HabitButtonView(habit:habit, isEditMode: $isEditMode)
                        
                    }
                }
                
               
                
                //Add habit
                HStack
                {
                    Spacer()
                    Button(
                        action:
                        {
                            showForm.toggle()
                        },
                        label:
                        {
                            Image(systemName: "plus.circle.fill")
                                .font(Font.system(size: 50))
                                .foregroundStyle(.indigo)
                                .padding(.trailing, 5)
                        }
                    )
                }
                
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $showForm, onDismiss: viewModel.onAddHabitDismissed, content:
        {
            AddHabitView()
                .presentationDragIndicator(.visible)
        })
        .toolbar
        {
            ToolbarItem(placement: .topBarTrailing)
            {
                Button(isEditMode ? "Done" : "Edit")
                {
                    isEditMode.toggle()
                    viewModel.refresHabits()
                }
            }
            
        }
    }
}

#Preview
{
    HabitListView()
}
