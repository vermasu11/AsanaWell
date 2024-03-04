//
//  GoalSelectionView.swift
//  AsanaWell
//
//  Created by Sumit on 3/2/24.
//

import SwiftUI


struct GoalSelectionView: View {
    
    
    private let goalOptions = ["Flexibility", "Stress Relief", "Weight Loss", "Strength", "Improved Circulation", "Better Sleep", "Increased Energy", "Mental Clarity"]
    
    @State private var selectedGoalOption = 0

    var body: some View {
        ZStack{
            
            Image("backgroundAsanaWell")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
            
            VStack {
                LazyVStack {
                    Text("Health Goal Selection")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .padding(.bottom, 20)
                    
                    
                    
                    ForEach(goalOptions.indices, id: \.self) { index in
                        OptionCard(title: goalOptions[index], isSelected: index == selectedGoalOption)
                            .onTapGesture {
                                withAnimation {
                                    selectedGoalOption = index
                                }
                            }.frame(maxWidth: 350)
                    }
                }
                .frame(width: 380)
                
                Spacer()
                
                
                
            }
            .padding()
            .frame(width: 380)
            .toolbar{
                NavigationLink(destination: DashboardView(), label: {Text("Save ")})
            }
            
        }
        
    }
}

struct GoalSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GoalSelectionView()
    }
}
