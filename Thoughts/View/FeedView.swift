//
//  FeedView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/06.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewThoughtView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.thoughts) { thought in
                        NavigationLink(destination: ThoughtDetailView(thought: thought)) {
                            ThoughtCell(thought: thought)
                        }
                    }
                }.padding()
            }
            
            Button(action:  { isShowingNewThoughtView.toggle() }, label: {
                Image("brains")
                    .resizable()
                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    .frame(width: 28, height: 28)
                    .padding()
            })
            .background(Color(.systemIndigo))
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding()
            .fullScreenCover(isPresented: $isShowingNewThoughtView) {
               NewThoughtsView(isPresented: $isShowingNewThoughtView)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
