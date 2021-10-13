//
//  ConversationsView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/06.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowingNewMessageView = false
    @State var showChat = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
           NavigationLink(destination: ChatView(),
                          isActive: $showChat,
                          label: {})
                        
            
            ScrollView {
                VStack {
                    ForEach(0..<20) { _ in
                        NavigationLink(
                            destination: ChatView(),
                            label: {
                                ConversationsCell()
                            })
                    }
                }.padding()
            }
            
            Button(action: { self.isShowingNewMessageView.toggle() }, label: {
                Image(systemName: "envelope.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .padding()
            })
            .background(Color(.systemIndigo))
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding()
            .sheet(isPresented: $isShowingNewMessageView, content: {
               NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
