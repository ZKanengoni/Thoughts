//
//  ProfileHeaderView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/11.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack {
            Image("user")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            Text("Unknown User")
                .font(.system(size: 20, weight: .semibold))
            
            Text("@UnknownUser")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 1)
            
            Text("A user no one really knows...")
                .padding(.top, 8)
            
            HStack(spacing: 50) {
                VStack {
                    Text("0")
                        .font(.system(size: 16))
                        .bold()
                    
                    Text("Thinkers")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        
                }
                
                VStack {
                    Text("0")
                        .font(.system(size: 16))
                        .bold()
                    
                    Text("Listerners")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
            }.padding()
            
            ProfileActionView(isCurrentUser: false)
            
            Spacer()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
