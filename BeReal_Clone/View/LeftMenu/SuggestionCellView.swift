//
//  SuggestionCellView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 11/08/2023.
//

import SwiftUI

struct SuggestionCellView: View {
    var body: some View {
        
        HStack {
            Image("pp")
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .cornerRadius(55)
            
            VStack(alignment: .leading) {
                Text("Dev Sang")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                
                Text("klasfhohofbnw")
                    .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .padding(.leading, -4)
                }
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.black)
                .opacity(0.8)
                .frame(width: 45, height: 25)
                .overlay {
                    Text("ADD")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                }
            
            Image(systemName: "xmark")
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.leading, 6)
        }
        .padding(.horizontal)
    }
}

struct SuggestionCellView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionCellView()
    }
}
