//
//  FeedViewModel.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/15.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var thoughts = [Thought]()
    
    init() {
        fetchThoughts()
    }
    
    func fetchThoughts() {
        COLLECTION_THOUGHTS.getDocuments { snapshot, _ in
            guard let document = snapshot?.documents else { return }
            self.thoughts = document.map({ Thought(dictionary: $0.data()) })
        }
    }
}
