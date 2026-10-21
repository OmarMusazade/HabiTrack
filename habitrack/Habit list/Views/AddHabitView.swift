//
//  AddHabitView.swift
//  habitrack
//
//  Created by Omar on 31.07.25.
//

import SwiftUI

struct AddHabitView: View {
    
    @StateObject var viewModel = AddHabitViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 20)
        {
            //Emoji
            TextField("😌", text:$viewModel.emoji.max(1))
                .frame(width: 60)
                .font(Font.system(size: 60))
                .padding(.top,39)
            
            
            //Title
            TextField("Title", text:$viewModel.title.max(16))
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading,10)
            
            //Description
            TextField("Description", text:$viewModel.descripton.max(64), axis: .vertical)
                .multilineTextAlignment(.leading)
                .padding(.leading,10)
                .font(.title2)
            
            //Error
            if(viewModel.error.count>0)
            {
                Text(viewModel.error)
                    .foregroundStyle(.red)
            }
            //Add
            Button(
                action:
                {
                    if(viewModel.addHabit())
                    {
                        presentationMode.wrappedValue.dismiss()
                    }
                        
                },
                label:
                {
                    Text("Add")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding()
                        .background(.indigo)
                        .fontWeight(.bold)
                        .cornerRadius(15)
                    
                }
            )
            Spacer()
        }
    }
}

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(limit))
            }
        }
        return self
    }
}

#Preview {
    AddHabitView()
}
