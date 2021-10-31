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
    
    func uploadThought(caption: String, thoughtImage: UIImage) {
        guard let imageData = thoughtImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = COLLECTION_THOUGHTS.document()
        
        storageRef.putData(imageData, metadata: nil) {_, error in
            if let error = error {
                print("DEBUG: Fialed to upload image \(error.localizedDescription)")
                
                return
            }
            
            print("DEBUG: Uploaded user photo...")
            
            storageRef.downloadURL { url, _ in
                guard let thoughtImageUrl = url?.absoluteString else { return }
                
                
                let data: [String: Any] = ["uid": user.id,
                                           "caption": caption,
                                           "fullname": user.fullname,
                                           "timestamp": Timestamp(date: Date()),
                                           "username": user.username,
                                           "profileImageUrl": user.profileImageUrl,
                                           "thoughtImageUrl": thoughtImageUrl,
                                           "likes": 0,
                                           "id": docRef.documentID
                ]
                
                docRef.setData(data) { _ in
                    print("Thought uploaded")
                    self.isPresented = false
                }
            }
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
