//
//  ConversationsCell.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/06.
//

import SwiftUI

struct ConversationsCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image("user2")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("@Childish")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Longer message text to see ehat happens when I do this")
                        .font(.system(size: 14))
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                }
                .foregroundColor(.black)
                .padding(.trailing)
            }
            
            Divider().padding()
        }
    }
}

struct ConversationsCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsCell()
    }
}
