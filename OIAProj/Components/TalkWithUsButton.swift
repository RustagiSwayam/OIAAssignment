//
//  TalkWithUsButton.swift
//  OIAProj
//
//  Created by Swayam Rustagi on 08/05/24.
//

import SwiftUI

struct TalkWithUsButton: View {
    
    var buttonWidth: CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            return screenWidth - 40
        }
        
    
    var body: some View {
        HStack{
            Image(systemName: "checkmark.message")
                .foregroundStyle(.green)
            
            Text("Talk with us")
            
            Spacer()
        }
        
        .padding(.horizontal)
        .font(.title2)
        .fontWeight(.semibold)
        .frame(width: buttonWidth, height: 60)
        .background(.green.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay{
            RoundedRectangle(cornerRadius: 12)
                .stroke(.green, lineWidth: 1)
        }
    }
    }


#Preview {
    TalkWithUsButton()
}
