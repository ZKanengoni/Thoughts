//
//  SignupView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/13.
//

import SwiftUI


struct SignupView: View {
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var username = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    var body: some View {
        ZStack {
            VStack {
                Button(action: { showImagePicker.toggle() }, label: {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 220, height:120)
                                .clipped()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .padding(.top, 160)
                                .padding(.bottom, 40)
                        } else {
                            Image("photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220, height:120)
                                .padding(.top, 160)
                                .padding(.bottom, 40)
                        }
                    }
                }).sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedUIImage)
                })
               
                
//                Text("Thoughts")
//                    .font(.system(size: 40.0))
//                    .foregroundColor(.white)
//                    .padding(.bottom, 20)
                
                
                
                VStack(spacing: 20){
                    
                    CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
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
                
                
                Button(action: {
                        guard let image = selectedUIImage else { return }
                        viewModel.registerUser(email: email, password: password, fullname: fullname, username: username,profileImage: image) }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(Color(.systemIndigo))
                        .frame(width: 360, height: 50, alignment: .center)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                })
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.white)
                        
                        Text("Login")
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

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
