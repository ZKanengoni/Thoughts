//
//  ThoughtCell.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/06.
//

import SwiftUI

struct ThoughtCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image("user")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56 / 2)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Unknown User")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text("@Unknown •")
                            .foregroundColor(.gray)
                        
                        Text("23hrs")
                            .foregroundColor(.gray)
                    }
                    
                    Text("What came first? The chicken or the egg?")
                }
                .padding(.bottom)
                .padding(.trailing)
            }
            
            HStack {
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bubble.left")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "heart")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bookmark")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                })
                
            }
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            Divider()
                .padding()
        }
    }
}

struct ThoughtCell_Previews: PreviewProvider {
    static var previews: some View {
        ThoughtCell()
    }
}
 
