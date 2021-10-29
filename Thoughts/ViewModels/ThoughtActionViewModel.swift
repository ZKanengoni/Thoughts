//
//  ThoughtActionViewModel.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/20.
//

import SwiftUI
import Firebase

class ThoughtActionViewModel: ObservableObject {
    let thought: Thought
    @Published var didLike = false
    
    init(thought: Thought) {
        self.thought = thought
        checkIfLiked()
    }
    
    func likeThought() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let thoughtRef = COLLECTION_THOUGHTS.document(thought.id)
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")

        
        thoughtRef.updateData(["likes": thought.likes + 1]) { _ in
            thoughtRef.collection("thought-likes").document(uid).setData([:]) { _ in
                userLikesRef.document(self.thought.id).setData([:]) { _ in
                    self.didLike = true
                }
            }
        }
    }
    
    func unlikeThought() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let thoughtRef = COLLECTION_THOUGHTS.document(thought.id)
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")

        
        thoughtRef.updateData(["likes": thought.likes - 1]) { _ in
            thoughtRef.collection("thought-likes").document(uid).delete { _ in
                userLikesRef.document(self.thought.id).delete { _ in
                    self.didLike = false
                }
            }
        }
        
    }
    
    func checkIfLiked() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let userLikesRef =  COLLECTION_USERS.document(uid).collection("user-likes").document(thought.id)
        
        userLikesRef.getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.didLike = didLike
        }
    }
    
}
