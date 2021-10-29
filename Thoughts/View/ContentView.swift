//
//  ContentView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/04.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @AppStorage("currentPage") var currentPage = 1

    var body: some View {
        if currentPage > totalPages{
            Group {
                if viewModel.userSession != nil {
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
                            
                            ConversationsView()
                                .tabItem {
                                    Image(systemName: "envelope")
                                    Text("Connect")
                                }
                        }
                        .navigationBarTitle("Thoughts")
                        .navigationBarItems(leading: Button(action:{
                            viewModel.signOut()
                        }, label: {
                            if let user = viewModel.user {
                                KFImage(URL(string: user.profileImageUrl))
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                                    .frame(width: 32, height: 32)
                                    .cornerRadius(16)
                            }
                        }))
                        .navigationBarTitleDisplayMode(.inline)
                        
                    }
                } else {
                    LoginView()
                }
            }
        } else {
            WalkthroughScreen()
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WalkthroughScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View{
    
        
        ZStack{
           
        
            if currentPage == 1{
                ScreenView(image:  "brains", title: "Thought is a place to share your ideas and thought s with others.", detail: "", bgColor: Color(.systemIndigo))
                    .transition(.scale)
            }
            if currentPage == 2{
            
                ScreenView(image: "brains", title: "Thoughts allows you to follow your favarite thinkers!", detail: "", bgColor: Color(.systemIndigo))
                    .transition(.scale)
            }
            
            if currentPage == 3{
                
                ScreenView(image: "brains", title: "Thoughts even allows you to message your thinker directly to continue to grow and share.", detail: "", bgColor: Color(.systemIndigo))
                    .transition(.scale)
            }
            
        }
        .overlay(
        
            Button(action: {
               
                withAnimation(.easeInOut){
                    
               
                    if currentPage <= totalPages{
                        currentPage += 1
                    }
                }
            }, label: {
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
        
                    .overlay(
                    
                        ZStack{
                            
                            Circle()
                                .stroke(Color.black.opacity(0.04),lineWidth: 4)
                                
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                                .stroke(Color.white,lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-15)
                    )
            })
            .padding(.bottom,20)
            
            ,alignment: .bottom
        )
    }
}

struct ScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20){
            
            HStack{
                
                if currentPage == 1{
                    Text("Hello!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                }
                else{
             
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut){
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .kerning(1.2)
                })
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            
            Text("Welcome to Thought.")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 120)
        }
        .background(bgColor.cornerRadius(10).ignoresSafeArea())
    }
}

var totalPages = 3

