//
//  CameraView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 16/08/2023.
//

import SwiftUI

struct CameraView: View {
    
    @State private var swithingCamera = false
    @State private var takePhotoClicked = false
    @State private var chooseFontPhoto = false
    @State private var photoTake = false

    @State private var selecteBackImage : UIImage?
    @State private var backImage : Image?
    @State private var selecteFontImage : UIImage?
    @State private var fontImage : Image?
    
    @ObservedObject var viewModel: CameraViewModel

    @Environment(\.dismiss) var dismiss
    
    init(viewModel: CameraViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        Text("BeReal.")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                
                VStack {
                    Text("04:57:11")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                    
                    ZStack(alignment: .topLeading) {
                        
                        GeometryReader { g in
                            VStack {
                                if fontImage != nil {
                                    HStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 125, height: 165)
                                            .overlay {
                                                VStack {
                                                    if let imageFont = fontImage {
                                                        imageFont.resizable()
                                                            .cornerRadius(8)
                                                            .frame(width: 120, height: 160)
                                                            .scaledToFit()
                                                    }
                                                }
                                            }
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    .padding(.top, 18)
                                }
                                Spacer()
                            }
                            .sheet(isPresented: $chooseFontPhoto) {
                                loadFontImage()
                                photoTake.toggle()
                                swithingCamera.toggle()
                            } content: {
                                ImagePicker(selectedImage: $selecteFontImage)
                            }

                        }
                        .zIndex(1)
                        
                        if let image  = backImage {
                            image
                                .resizable()
                                .cornerRadius(12)
                                .frame(width:  UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
                        }
                        else
                        {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.gray)
                                .frame(width:  UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
                                .overlay {
                                    VStack {
                                        ProgressView()
                                            Text("Wait, wait, wait, now smile")
                                    }
                                    .foregroundColor(.white)
                                    .opacity(swithingCamera ? 1 : 0)
                                }
                                .sheet(isPresented: $takePhotoClicked,onDismiss: {
                                    loadBackImage()
                                    swithingCamera.toggle()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                        self.chooseFontPhoto.toggle()
                                    }
                                }) {
                                    ImagePicker(selectedImage: $selecteBackImage)
                                }
                        }
                    }
                    
                    VStack {
                        if !photoTake {
                            Button {
                                sent()
                            } label: {
                                HStack {
                                    Text("SEND")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40, weight: .black))
                                    Image(systemName: "location.north.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .black))
                                        .rotationEffect(.degrees(90))
                                }
                            }

                        }
                        else {
                            HStack(alignment: .center, spacing: 18) {
                                Image(systemName: "bolt.slash.fill")
                                    .font(.system(size: 28))
                                
                                Button {
                                    takePhotoClicked.toggle()
                                } label: {
                                    Image(systemName: "circle")
                                        .font(.system(size: 70))
                                }
                                
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .font(.system(size: 24))

                            }
                            .foregroundColor(.white)
                        }

                    }
                    .offset(y: -20)
                    
                    Spacer()
                    
                }
                .padding(.top, 50)
                
            }
        }
    }
    
    func loadBackImage() {
        guard let selecteBackImage = selecteBackImage else { return }
        backImage = Image(uiImage: selecteBackImage)
    }
    func loadFontImage() {
        guard let selecteFontImage = selecteFontImage else { return }
        backImage = Image(uiImage: selecteFontImage)
    }
    
    func sent() {
        if selecteBackImage != nil && selecteFontImage != nil {
            viewModel.takePhoto(backImage: selecteBackImage!, fontImage: selecteFontImage!) { backImageUrl, fontImageUrl in
                Task {
                   await viewModel.postBeReal(fontImageUrl: fontImageUrl, backImageUrl:backImageUrl)
                    dismiss
                }
            }
        }
        
    }
}

//struct CameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraView()
//    }
//}
