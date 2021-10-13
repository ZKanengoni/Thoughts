//
//  ChatBubble.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/06.
//

import SwiftUI

struct ChatBubble: Shape {
    var isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, isFromCurrentUser ? .bottomRight : .bottomLeft], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
    
   
 
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isFromCurrentUser: false)
    }
}
