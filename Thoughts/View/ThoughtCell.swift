//
//  ThoughtCell.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/06.
//

import SwiftUI
import Kingfisher

struct ThoughtCell: View {
    let thought: Thought
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                KFImage(URL(string: thought.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56 / 2)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(thought.fullname)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        
                        Text("@\(thought.username) •")
                            .foregroundColor(.gray)
                        
                        Text("23hrs")
                            .foregroundColor(.gray)
                    }
                    
                    Text(thought.caption)
                        .foregroundColor(.black)
                }
                .padding(.bottom)
                .padding(.trailing)
            }
            
//            HStack {
//                Spacer()
//
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                    Image(systemName: "bubble.left")
//                        .font(.system(size: 16))
//                        .frame(width: 32, height: 32)
//                })
//
//                Spacer()
//
//                Button(action: {}, label: {
//                    Image(systemName: "arrow.2.squarepath")
//                        .font(.system(size: 16))
//                        .frame(width: 32, height: 32)
//                })
//
//                Spacer()
//
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                    Image(systemName: "heart")
//                        .font(.system(size: 16))
//                        .frame(width: 32, height: 32)
//                })
//
//                Spacer()
//
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                    Image(systemName: "bookmark")
//                        .font(.system(size: 16))
//                        .frame(width: 32, height: 32)
//                })
//
//            }
//            .foregroundColor(.gray)
//            .padding(.horizontal)
            
            ThoughtAction(thought: thought)
            
            Divider()
                .padding()
        }
    }
}
