//
//  SearchBar.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 11/08/2023.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        
        HStack {
            TextField("", text: $text)
                .padding(8)
                .frame(height: 50)
                .padding(.horizontal, 24)
                .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                .cornerRadius(8)
                .padding(8)
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: 25, alignment: .leading)
                        
                        Text(text.isEmpty ? "Search friends" : "")
                            .foregroundColor(.gray)
                            .padding(.leading, -4)
                        
                        Spacer()
                    }
                    .padding(.leading)
                }
                
            
            if isEditing {
                Button {
                    isEditing = false
                    text = ""
                } label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
        .onTapGesture {
            isEditing = true
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), isEditing: .constant(false))
    }
}
