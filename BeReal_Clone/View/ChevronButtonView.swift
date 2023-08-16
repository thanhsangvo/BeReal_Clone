//
//  ChevronButtonView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 12/08/2023.
//

import SwiftUI

struct ChevronButtonView: View {
    var icon: String
    var text: String
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 45)
                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
            
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)

                Text(text)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
            .frame(height: 30)
            
            
        }
    }
}

//struct ChevronButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChevronButtonView(icon: <#String#>, text: <#String#>)
//    }
//}
