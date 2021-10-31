//
//  NewThoughtsView.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/13.
//

import SwiftUI
import Kingfisher

struct NewThoughtsView: View {
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @ObservedObject var viewModel: UploadThoughtViewModel
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self.viewModel = UploadThoughtViewModel(isPresented: isPresented)
    }
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                    }
                    
                    VStack {
                        TextArea("What's going on? Share a thought...", text: $captionText)
                        
                        Spacer()
                        
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
                                    Image("cloud")
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
                    }
                        
                }
                .padding()
                .navigationBarItems(leading: Button(action:  {isPresented.toggle()}, label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemIndigo))
                }),
                
                trailing: Button(action: {
                    guard let image = selectedUIImage else { return }
                    viewModel.uploadThought(caption: captionText, thoughtImage: image)
                }, label: {
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
