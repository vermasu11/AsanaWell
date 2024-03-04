//
//  SplashView.swift
//  AsanaWell
//
//  Created by Sumit on 3/1/24.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        
        ZStack {
            Image("backgroundAsanaWell")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(1)
            
            
            if isActive {
                LoginView()
            } else {
                VStack {

                    Image("AsanaWell")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding(.bottom, 60)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        self.isActive = true
                    }
                }
            }
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
