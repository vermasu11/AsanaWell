//
//  DashboardView.swift
//  AsanaWell
//
//  Created by Sumit on 3/1/24.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedTab = "Dashboard"
    
    var body: some View {
        ZStack {
            
            Image("backgroundAsanaWell-2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
            
            VStack {
                
                switch selectedTab {
                case "My Asana":
                    MyAsanaView()
                case "Dashboard":
                    HomeView()
                case "Profile":
                    UserProfileView()
                default:
                    Text("Selection does not exist")
                }
                
                Spacer()
                
                HStack {
                    TabBarButton(selectedTab: $selectedTab, imageName: "list.dash", tabName: "My Asana")
                    Spacer()
                    TabBarButton(selectedTab: $selectedTab, imageName: "square.grid.2x2", tabName: "Dashboard")
                    Spacer()
                    TabBarButton(selectedTab: $selectedTab, imageName: "person.crop.circle", tabName: "Profile")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal)
            }
            .navigationBarBackButtonHidden(true)
            .padding(.top, 30)
            .navigationBarTitle(Text(selectedTab).font(.largeTitle), displayMode: .inline)
            
        }
    }
    
}


struct TabBarButton: View {
    @Binding var selectedTab: String
    var imageName: String
    var tabName: String
    
    var body: some View {
        Button(action: {
            selectedTab = tabName
        }) {
            VStack {
                Image(systemName: imageName)
                    .font(.title)
                Text(tabName)
                    .font(.caption)
            }
        }
        .foregroundColor(selectedTab == tabName ? .blue : .gray)
    }
}

struct Asana: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct HomeView: View {
    
    let asanas: [Asana] = [
        Asana(name: "Downward Dog", imageName: "downwardDog"),
        Asana(name: "Tree Pose", imageName: "treePose"),
        Asana(name: "Camel Pose", imageName: "camelPose"),
        Asana(name: "Tadasana", imageName: "tadasana"),
        Asana(name: "Cobra Pose", imageName: "cobraPose"),
        Asana(name: "Warrior Pose", imageName: "warriorPose"),
        Asana(name: "Bridge Pose", imageName: "bridgePose"),
        Asana(name: "Chaturanga", imageName: "chaturanga"),
        Asana(name: "Boat Pose", imageName: "boatPose"),
        // Add more asanas
    ]
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(asanas) { asana in
                    NavigationLink(destination: AsanaDetailView(asana: asana)) {
                        AsanaCard(asana: asana, cardWidth: 173, cardHeight: 220, ImgWidth: 140, ImgHeight: 145)
                    }
                }
            }
            .padding()
            .frame(width: 385)
        }
    }
        
}

struct AsanaCard: View {
    let asana: Asana
    var cardWidth: CGFloat
    var cardHeight: CGFloat
    var ImgWidth: CGFloat
    var ImgHeight: CGFloat
    
    var body: some View {
        VStack {
            Image(asana.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: ImgWidth, height: ImgHeight)
            Text(asana.name)
                .fontWeight(.semibold)
        }
        .padding()
        .frame(width: cardWidth, height: cardHeight)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


struct AsanaDetailView: View {
    let asana: Asana
    
    var body: some View {
        Text("Details for \(asana.name)")
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
