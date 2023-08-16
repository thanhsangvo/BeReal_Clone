//
//  ThreeDots.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 09/08/2023.
//

import SwiftUI

struct ThreeDots: View {
    
    var size: CGFloat
    var color: Color
    
    
    var body: some View {
        
        HStack {
            Image(systemName: "circle.fill")
                .foregroundColor(color)
                .font(.system(size: size))
            Image(systemName: "circle.fill")
                .foregroundColor(color)
                .font(.system(size: size))
            Image(systemName: "circle.fill")
                .foregroundColor(color)
                .font(.system(size: size))
        }
    }
}

struct ThreeDots_Previews: PreviewProvider {
    static var previews: some View {
        ThreeDots(size: 3, color: .black)
    }
}
