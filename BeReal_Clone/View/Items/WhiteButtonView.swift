//
//  WhiteButtonView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 12/08/2023.
//

import SwiftUI

struct WhiteButtonView: View {
    var txt : String
    @Binding var buttonActive: Bool
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 45)
                .foregroundColor(buttonActive ? Color(red: 250/255, green: 250/255, blue: 250/255) : Color(red: 86/255, green: 86/255, blue: 86/255))
            
            HStack {
                Spacer()
                Text(txt)
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                Spacer()
            }
            .padding(.horizontal, UIScreen.main.bounds.width * 0.1)
            .frame(height: 30)
        }
    }
}

//struct WhiteButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        WhiteButtonView()
//    }
//}
