//
//  ActivityTile.swift
//  OIAProj
//
//  Created by Swayam Rustagi on 08/05/24.
//

import SwiftUI

struct ActivityTile: View {
    
    let imageName: String
    let imageColor: Color
    let imageBGColor: Color
    let mainInfo: String
    let secondaryInfo: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            
            HStack{
                Image(systemName: imageName)
                    .foregroundStyle(imageColor)
                    .frame(width: 50, height: 50)
                    .background(imageBGColor.opacity(0.25))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .frame(alignment: .leading)
            
            VStack(alignment: .leading, spacing: 10){
                Text(mainInfo)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
                Text(secondaryInfo)
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding()
        
    }
}

#Preview {
    ActivityTile(imageName: "cursorarrow.click", imageColor: .purple, imageBGColor: .indigo, mainInfo: "123", secondaryInfo: "Today's Clicks")
}
