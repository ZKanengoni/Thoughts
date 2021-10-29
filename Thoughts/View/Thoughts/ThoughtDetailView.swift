//
//  ThoughtDetailView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/15.
//

import SwiftUI
import Kingfisher

struct ThoughtDetailView: View {
    let thought: Thought
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                KFImage(URL(string: thought.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(thought.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("@\(thought.username)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            
            Text(thought.caption)
                .font(.system(size: 22))
            
            Text("10:14 AM 14/19/2021")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Divider()

            HStack(spacing: 12) {
                HStack(spacing: 4) {
                    Text("0")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Shares")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 4) {
                    Text("\(thought.likes)")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Likes")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
           
            
            Divider()

            ThoughtAction(thought: thought)
            
            Spacer()
        }
        .padding()
    }
}
