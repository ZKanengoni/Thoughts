//
//  Constants.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/14.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
let COLLECTION_THOUGHTS = Firestore.firestore().collection("thoughts")
