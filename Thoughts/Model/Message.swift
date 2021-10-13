//
//  Message.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/07.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}


let MOCK_MESSAGE: [MockMessage] = [
    .init(id: 0, imageName: "user2", messageText: "Hey what's up?", isCurrentUser: false),
    .init(id: 1, imageName: "user", messageText: "Nothing much and you?", isCurrentUser: true),
    .init(id: 2, imageName: "user2", messageText: "Just chilling", isCurrentUser: false),
    .init(id: 3, imageName: "user", messageText: "Dope!", isCurrentUser: true)
]

