//
//  ProfileHeaderView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/11.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @State var slectedFilter: ThoughtFilterOptions = .thoughts
    @Binding var isFollowed: Bool
    let viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            KFImage(URL(string: viewModel.user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            Text(viewModel.user.fullname)
                .font(.system(size: 20, weight: .semibold))
            
            Text("@\(viewModel.user.username)")
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
            
            ProfileActionView(viewModel: viewModel, isFollowed: $isFollowed)
        
            Spacer()
        }
    }
}


