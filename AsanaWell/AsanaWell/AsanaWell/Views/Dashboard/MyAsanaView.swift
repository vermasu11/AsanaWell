//
//  MyAsanaView.swift
//  AsanaWell
//
//  Created by Sumit on 3/3/24.
//

import SwiftUI

struct MyAsanaView: View {
    
    let asanas: [Asana] = [
        Asana(name: "Tadasana", imageName: "tadasana"),
        Asana(name: "Cobra Pose", imageName: "cobraPose"),
        Asana(name: "Warrior Pose", imageName: "warriorPose"),
        Asana(name: "Bridge Pose", imageName: "bridgePose"),
        Asana(name: "Chaturanga", imageName: "chaturanga"),
        Asana(name: "Boat Pose", imageName: "boatPose"),
        Asana(name: "Downward Dog", imageName: "downwardDog"),
        Asana(name: "Tree Pose", imageName: "treePose"),
        Asana(name: "Camel Pose", imageName: "camelPose"),
        
        // Add more asanas
    ]
    
    var body: some View {
        
        TabView {
            
            ForEach(asanas) { asana in
                NavigationLink(destination: AsanaDetailView(asana: asana)) {
                    AsanaCard(asana: asana, cardWidth: 340, cardHeight: 450, ImgWidth: 305, ImgHeight: 325)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: 380.0)
        .tabViewStyle(PageTabViewStyle())
        .navigationBarTitle("My Asana")
        
    }
}


struct MyAsanaView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyAsanaView()
        }
        
    }
}
