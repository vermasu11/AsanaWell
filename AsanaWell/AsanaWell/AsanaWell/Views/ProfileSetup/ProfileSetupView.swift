//
//  ProfileSetupView.swift
//  AsanaWell
//
//  Created by Sumit on 3/1/24.
//

import SwiftUI

struct ProfileSetupView: View {
    @State private var isShowingDetailedSetup = false
    
    var body: some View {
        ZStack {
            Image("backgroundAsanaWell")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
            
            VStack {
                
                Spacer()
                
                Text("Welcome to AsanaWell")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Personalize Your Journey!")
                        .fontWeight(.bold)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                    
                    Text("Complete your profile to get tailored yoga sessions, designed just for you.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: SettingupView(),
                    label: {
                        Text("Set up Profile")
                        .font(.title2)
                            .foregroundColor(.white)
                            .frame( maxWidth: 140)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.green.opacity(0.8)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(30)
                    })
                
                NavigationLink(destination: DashboardView(),
                    label: {
                        Text("Skip for now")
                        .foregroundColor(.blue)
                    })
                .padding()
                
                Spacer()
                Spacer()
                Spacer()
            }
            .padding()
            .frame(width: 390)
        }
        .navigationBarHidden(true)
    }
}



struct ProfileSetupView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSetupView()
    }
}
