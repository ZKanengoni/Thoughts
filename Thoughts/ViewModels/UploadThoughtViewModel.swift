//
//  UploadThoughtViewModel.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/14.
//

import SwiftUI
import Firebase

class UploadThoughtViewModel: ObservableObject {
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func uploadThought(caption: String) {
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = COLLECTION_THOUGHTS.document()
        
        let data: [String: Any] = ["uid": user.id,
                                   "caption": caption,
                                   "fullname": user.fullname,
                                   "timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   "profileImageUrl": user.profileImageUrl,
                                   "likes": 0,
                                   "id": docRef.documentID
        ]
        
        docRef.setData(data) { _ in
            print("Thought uploaded")
            self.isPresented = false
        }
    }
    
//    func uploadThought(caption: String, completion: @escaping((Error?) -> Void)) {
//        guard let user = AuthViewModel.shared.user else { return }
//        let docRef = COLLECTION_THOUGHTS.document()
//
//        let data: [String: Any] = ["uid": user.id,
//                                   "caption": caption,
//                                   "fullname": user.fullname,
//                                   "timestamp": Timestamp(date: Date()),
//                                   "username": user.username,
//                                   "profileImageUrl": user.profileImageUrl,
//                                   "likes": 0,
//                                   "id": docRef.documentID
//        ]
//
//        docRef.setData(data, completion: completion)
//    }
}
