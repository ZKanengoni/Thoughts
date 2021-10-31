//
//  ProfileActionView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/11.
//

import SwiftUI

struct ProfileActionView: View {
    let viewModel: ProfileViewModel
    
    var body: some View {
        if viewModel.user.isCurrentUser {
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
                    action: {
                        viewModel.user.isFollowed ? viewModel.unfollow() : viewModel.follow()
                    }, label: {
                        Text(viewModel.user.isFollowed ? "Following" : "Follow")
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
