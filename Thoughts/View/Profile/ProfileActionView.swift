//
//  ProfileActionView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/11.
//

import SwiftUI

struct ProfileActionView: View {
    let isCurrentUser: Bool
    var body: some View {
        if isCurrentUser {
            Button (
                action: {}, label: {
                    Text("Edit Profile")
                        .frame(width: 360, height: 40)
                        .background(Color(.systemIndigo))
                        .foregroundColor(.white)
                })
                .cornerRadius(20)
        } else {
            HStack {
                Button (
                    action: {}, label: {
                        Text("Follow")
                            .frame(width: 180, height: 40)
                            .background(Color(.systemIndigo))
                            .foregroundColor(.white)
                    })
                    .cornerRadius(20)
                
                Button (
                    action: {}, label: {
                        Text("Message")
                            .frame(width: 180, height: 40)
                            .background(Color(.systemGray))
                            .foregroundColor(.white)
                    })
                    .cornerRadius(20)
            }
        }
        
    }
}

struct ProfileActionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionView(isCurrentUser: true)
    }
}
