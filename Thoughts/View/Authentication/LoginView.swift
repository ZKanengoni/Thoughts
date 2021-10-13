//
//  LoginView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/13.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("brains")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .padding(.top, 160)
                        .padding(.bottom, 40)
                    
    //                Text("Thoughts")
    //                    .font(.system(size: 40.0))
    //                    .foregroundColor(.white)
    //                    .padding(.bottom, 20)
                    
                    VStack(spacing: 20){
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"),
                                        imageName: "lock")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 32)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Forgot Password")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                                .padding(.top, 20)
                                .padding(.trailing, 32)
                        })
                    }
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(Color(.systemIndigo))
                            .frame(width: 360, height: 50, alignment: .center)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: SignupView().navigationBarBackButtonHidden(true),
                        label: {
                            HStack {
                                Text("Dont' have an account?")
                                    .foregroundColor(.white)
                                
                                Text("Sign Up")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                            .padding(.bottom, 40)
                        })
                    
                 
                }
            }
            .background(Color(.systemIndigo))
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
