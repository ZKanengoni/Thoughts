//
//  ContentView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "lightbulb")
                        Text("Thought")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                
                Text("Message")
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("Connect")
                    }
            }
            .navigationBarTitle("Thoughts")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
