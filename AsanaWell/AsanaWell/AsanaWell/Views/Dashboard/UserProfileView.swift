//
//  UserProfileView.swift
//  AsanaWell
//
//  Created by Sumit on 3/3/24.
//

import SwiftUI

struct UserProfileView: View {
    
    @State private var firstName: String = "Sumit"
    @State private var lastName: String = "Verma"
    @State private var username: String = "vermasu"
    @State private var emailAddress: String = "sumitve@gmail.com"
    
    var body: some View {
        
        VStack() {
            Form {
                
                
                Section(header: Text("Personal Info")) {
                    HStack {
                        Text("First Name:")
                        Spacer()
                        Text(firstName)
                            .foregroundColor(.gray)
                            .frame(alignment: .trailing)
                    }
                    
                    HStack {
                        Text("Last Name:")
                        Spacer()
                        Text(lastName)
                            .foregroundColor(.gray)
                            .frame(alignment: .trailing)
                    }
                    
                    HStack {
                        Text("Username:")
                        Spacer()
                        Text(username)
                            .foregroundColor(.gray)
                            .frame(alignment: .trailing)
                    }
                    
                    HStack {
                        Text("Email Address:")
                        Spacer()
                        Text(emailAddress)
                            .foregroundColor(.gray)
                            .frame(alignment: .trailing)
                    }
                }
                
                
                Section {
                    NavigationLink("Edit Preferences", destination: SettingupView())
                }
                
                Section {
                    Button("Log Out") {
                        // log out action
                    }
                    .foregroundColor(.red)
                }
            }
            .background(Color.clear)
            
        }
        .frame(width: 380.0)
        
        
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
