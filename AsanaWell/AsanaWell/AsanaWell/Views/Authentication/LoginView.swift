//
//  LoginView.swift
//  AsanaWell
//
//  Created by Sumit on 3/1/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isShowingDashboard: Bool = false
    
    let apple: UIImage = UIImage(named: "apple")!
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Image("backgroundAsanaWell")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.9)
                
                VStack(spacing: 20) {
                    
                    
                    Image("AsanaWell")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                    
                    HStack {
                        
                        Image(systemName: "person").foregroundColor(.black)
                        
                        TextField("Username", text: $username)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                    
                    HStack {
                        
                        Image(systemName: "lock").foregroundColor(.black)
                        
                        SecureField("Password", text: $password)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                    
                    NavigationLink(destination: ProfileSetupView(), label: {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame( maxWidth: 100)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.green.opacity(0.8)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(15)
                    })
                    .padding(.bottom, 40)
                    
                    Divider()
                        .frame(width: 300, height: 2)
                        .background(Color.white)
                        .cornerRadius(80)
                   
                    VStack {
                        SocialLoginButton(image: Image("apple"), text: Text("Sign in with Apple"))
                        
                        SocialLoginButton(image: Image("google"), text: Text("Sign in with Google"))
                    }
                   
                    
                    
                    
                    
                    Spacer()
                    
                    
                    Text("Breathe..Stretch..Relax")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            .transition(.slide)
            .navigationBarHidden(true)
        }
        .accentColor(Color(.label))
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct SocialLoginButton: View {
    var image: Image
    var text: Text
    
    var body: some View {
        HStack {
            
            image
                .resizable()
                .frame(width: 24, height: 24)
                .padding(.horizontal)
            Spacer()
            text
                .font(.title3)
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: 350)
        .background(Color.white)
        .cornerRadius(50.0)
        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
    }
}
