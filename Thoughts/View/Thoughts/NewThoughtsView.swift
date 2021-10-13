//
//  NewThoughtsView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/13.
//

import SwiftUI

struct NewThoughtsView: View {
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    Image("user")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    
                    TextArea("What's going on? Share a thought...", text: $captionText)
                    
                    Spacer()
                        
                }
                .padding()
                .navigationBarItems(leading: Button(action:  {isPresented.toggle()}, label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemIndigo))
                })
                    , trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Share")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color(.systemIndigo))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                }))
                Spacer()
            }
            
        }
    }
}

struct NewThoughtsView_Previews: PreviewProvider {
    static var previews: some View {
        NewThoughtsView(isPresented: .constant(true))
    }
}
