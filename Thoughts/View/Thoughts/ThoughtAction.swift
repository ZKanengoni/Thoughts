//
//  ThoughtAction.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/15.
//

import SwiftUI

struct ThoughtAction: View {
    let thought: Thought
    @ObservedObject var viewModel: ThoughtActionViewModel
    
    init(thought: Thought) {
        self.thought = thought
        self.viewModel = ThoughtActionViewModel(thought: thought)
    }
    
    var body: some View {
        HStack {
    
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "bubble.left")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            
            Spacer()
            
            Button(action: {
                viewModel.didLike ? viewModel.unlikeThought() : viewModel.likeThought()
            }, label: {
                Image(systemName: viewModel.didLike ? "heart.fill" : "heart" )
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
                    .foregroundColor(viewModel.didLike ? .red : .gray )
            })
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "bookmark")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            
        }
        .foregroundColor(.gray)
        .padding(.horizontal)    }
}
