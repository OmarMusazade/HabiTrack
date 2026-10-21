//
//  ContentView.swift
//  habitrack
//
//  Created by Omar on 29.07.25.
//

import SwiftUI

struct WelcomeView: View
{
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var body: some View
    {
        NavigationView
        {
            
        
        ZStack
            {
                //MARK: background
                ZStack
                {
                    Circle()
                        .foregroundStyle(.cyan)
                        .frame(width:300)
                        .offset(x: 250,y:-150)
                    Circle()
                        .foregroundStyle(.orange)
                        .frame(width:320)
                        .offset(x: -255,y:215)
                    Circle()
                        .foregroundStyle(.brown)
                        .frame(width:280)
                        .offset(x: -230,y:-300)
                }
                
                VStack(spacing:15)
                {
                    Text("Habitrack")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Track your habits")
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    NavigationLink(destination: HabitListView().navigationBarBackButtonHidden())
                    {
                        
                        Text("Start")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding()
                            .background(.indigo)
                            .fontWeight(.bold)
                            .cornerRadius(15)
                    }
                    
                }
                .padding()
            }
        }
    }
}

#Preview
{
    WelcomeView()
}
