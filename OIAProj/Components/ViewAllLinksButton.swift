//
//  ViewAllLinksButton.swift
//  OIAProj
//
//  Created by Swayam Rustagi on 08/05/24.
//

import SwiftUI

struct ViewAllLinksButton: View {
    
    var buttonWidth: CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            return screenWidth - 40
        }
        
        var body: some View {
            HStack{
                Image(systemName: "link")
                
                Text("View All Links")
            }
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: buttonWidth, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay{
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray, lineWidth: 1)
            }
        }
    }

#Preview {
    ViewAllLinksButton()
}
