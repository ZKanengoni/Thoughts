//
//  ProfileViewModel.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/14.
//

import Foundation
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var userThoughts = [Thought]()
    @Published var likedThoughts = [Thought]()
    
    init(user: User) {
        self.user = user
        checkIFUserIsFollowed()
        getUserThought()
        fetchLikedThoughts()
    }
   
    func thoughts(forFilter filter: ThoughtFilterOptions) -> [Thought] {
        switch filter {
        case .thoughts: return userThoughts
        case .likes: return likedThoughts
        }
    }
}

extension ProfileViewModel {
    func follow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        
        followingRef.document(currentUid).collection("user-following").document(user.id).setData([:]) { _ in
            followersRef.document(currentUid).setData([:]) { _ in
                self.user.isFollowed  = true
            }
        }
    }
    
    func unfollow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        
        followingRef.document(user.id).delete() { _ in
            followersRef.document(currentUid).delete { _ in
                self.user.isFollowed = false
            }
        }
    }
    
    func checkIFUserIsFollowed() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        guard !user.isCurrentUser else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        
        followingRef.document(user.id).getDocument {snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            self.user.isFollowed = isFollowed
        }
    }
    
    func getUserThought() {
        COLLECTION_THOUGHTS.whereField("uid", isEqualTo: user.id).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.userThoughts = documents.map({ Thought(dictionary: $0.data()) })
        }
    }
    
    func fetchLikedThoughts() {
        var thoughts = [Thought]()
        COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { snapshot , _ in
            guard let documents = snapshot?.documents else { return }
            let thoughtIDs = documents.map({ $0.documentID })
            
            thoughtIDs.forEach { id in
                COLLECTION_THOUGHTS.document(id).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let thought = Thought(dictionary: data)
                    thoughts.append(thought)
                    guard thoughts.count == thoughtIDs.count else { return }
                    
                    self.likedThoughts = thoughts
                }
            }
        }
    }
    
    func fetchUserStats() {
       let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        let followingRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-following")
        
        
        followersRef.getDocuments { snapshot, _ in
            guard let followerCount = snapshot?.documents.count else { return }
            
            followingRef.getDocuments { snapshot, _ in
                guard let followingCount = snapshot?.documents.count else { return }
                
                self.user.stats = UserStats(followers: followerCount, following: followingCount)
            }
        }
    }
}
