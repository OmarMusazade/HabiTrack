//
//  HabitButtonView.swift
//  habitrack
//
//  Created by Omar on 30.07.25.
//

import SwiftUI

struct HabitButtonView: View {
    
    @ObservedObject var viewModel: HabitButtonViewModel
    @Binding var isEditMode: Bool
    
    init(habit: Habit, isEditMode: Binding<Bool>)
    {
        viewModel=HabitButtonViewModel(habit: habit)
        self._isEditMode=isEditMode
    }
    var body: some View {
        if(!viewModel.isDeleted){
            Button(
                action:
                    {
                        viewModel.buttonChecked()
                    },
                label:
                    {
                        HStack(alignment: .center, spacing: 15)
                        {
                            //Emoji
                            Text(viewModel.habit.emoji)
                                .font(Font.system(size:35))
                                .padding(.leading)
                            
                            //Habit description
                            VStack(alignment: .leading)
                            {
                                Text(viewModel.habit.title)
                                    .foregroundStyle(.indigo)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                Text(viewModel.habit.description)
                                    .foregroundStyle(.brown)
                                    .font(.subheadline)
                                    .multilineTextAlignment(.leading)
                                Text(" \(viewModel.isLastDateOfStreakToday() ? "🔥 " : "")\(viewModel.habit.streak)  \(viewModel.habit.streak == 1 ? "day" : "days") streak")
                                    .font(.subheadline)
                                    .foregroundStyle(Color(red: 0/255, green: 128/255, blue: 128/255))
                            }
                            Spacer()
                            
                            if(viewModel.isLastDateOfStreakToday() && !isEditMode)
                            {
                                Image(systemName:"checkmark.circle.fill")
                                    .font(Font.system(size:50))
                                    .foregroundStyle(.indigo)
                                    .padding(.trailing,-10)
                            }
                            
                            if(isEditMode && !viewModel.isDeleted)
                            {
                                Button(
                                    action:
                                        {
                                            viewModel.deleteHabit()
                                        },
                                    label:
                                        {
                                            Image(systemName:"minus.circle.fill")
                                                .font(Font.system(size:50))
                                                .foregroundStyle(.red)
                                                .padding(.trailing,-10)
                                            
                                        })
                            }
                            
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(15)
                        .shadow(color: Color(.systemGray),radius: 3)
                    }
            )
            .disabled(viewModel.isLastDateOfStreakToday() && !isEditMode)
        }
    }
}

#Preview
{
    HabitButtonView(habit: DeveloperPreview.habits[0], isEditMode: .constant(true))
}
