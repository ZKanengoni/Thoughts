//
//  UserProfileView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/11.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    @State var selectedFilter: ThoughtFilterOptions = .thoughts
   
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(viewModel: viewModel)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(viewModel.thoughts(forFilter: selectedFilter)) { thought in
                    ThoughtCell(thought: thought)
                        .padding()
                }
            }
            
            .navigationTitle(user.username)
        }
    }
}
