//
//  MemoriesView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 12/08/2023.
//

import SwiftUI

struct MemoriesView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Text("Memories")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "arrow.backward")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                            }

                            
                            Spacer()
                        }
                    }
                    
                    VStack {
                        VStack {
                            HStack {
                                Text("Your memories are activated")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                Spacer()
                            }
                            Text("All your BeReal are automatically added to your Memories and onlu visible by you")
                                .foregroundColor(.white)
                                .padding(.top, -2)
                        }
                        .padding(.top)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 210)
                            .foregroundColor(Color(red: 22/255, green: 4/255, blue: 3/255))
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.red, lineWidth: 1)
                            }
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Deactive and Delete Memories")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            VStack {
                                HStack {
                                    Text("If you deactive your Memories, all your BeReal will be permanently deleted and unrecoverable")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14))
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("All your future BeReal won't be saved in Memeries and will be automatically deleted as wel")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14))
                                    Spacer()
                                }
                            }
                            .padding(.top, -6)
                            
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: UIScreen.main.bounds.width * 0.5, height: 40)
                                .foregroundColor(Color(red: 44/255, green: 44/255, blue: 46/255))
                                .overlay {
                                    Text("Deactivate Memories")
                                        .foregroundColor(.red)
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                }
                                .padding(.top, 8)
                        }
                        .padding(.leading)

                    }
                    .padding(.top, 22)
                    Spacer()
                }
                .padding(.horizontal)
                
            }
        }
    }
}

struct MemoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MemoriesView()
    }
}
