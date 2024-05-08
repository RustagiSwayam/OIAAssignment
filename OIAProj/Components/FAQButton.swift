//
//  FAQButton.swift
//  OIAProj
//
//  Created by Swayam Rustagi on 08/05/24.
//

import SwiftUI

struct FAQButton: View {
    
    var buttonWidth: CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            return screenWidth - 40
        }
        
    
    var body: some View {
        HStack{
            Image(systemName: "questionmark.circle.fill")
                .foregroundStyle(.blue)
            
            Text("Frequently Asked Questions")
                .font(.title3)
            
            Spacer()
        }
        
        .padding(.horizontal)
        .font(.title2)
        .fontWeight(.semibold)
        .frame(width: buttonWidth, height: 60)
        .background(.blue.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay{
            RoundedRectangle(cornerRadius: 12)
                .stroke(.blue, lineWidth: 1)
        }
    }
}

#Preview {
    FAQButton()
}
