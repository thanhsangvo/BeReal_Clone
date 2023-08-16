//
//  FriendCellView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 12/08/2023.
//

import SwiftUI

struct FriendCellView: View {
    var body: some View {
        HStack {
            Image("pp")
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .cornerRadius(65)
            
            VStack(alignment: .leading) {
                Text("DevSang")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Text("ndkankdnak")
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "xmark")
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.leading, 6)
        }
        .padding(.horizontal)
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView()
    }
}
