//
//  UserProfileView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/11.
//

import SwiftUI

struct UserProfileView: View {
    @State var selectedFilter: ThoughtFilterOptions = .thoughts
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(0..<5) { thought in
                    ThoughtCell()
                }
            }
            
            .navigationTitle("UnknownUser")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
            .padding()
    }
}
