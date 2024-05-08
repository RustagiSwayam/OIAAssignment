//
//  LinkTile.swift
//  OIAProj
//
//  Created by Swayam Rustagi on 08/05/24.
//

import SwiftUI

struct LinkTile: View {
    
    let title: String
    let originalImage: String
    let clicks: Int
    let smartLink: String
    
    var body: some View {
        VStack{
            VStack{
                HStack(spacing: 20){
                    AsyncImage(url: URL(string: originalImage)) { image in
                                    image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 80, height: 80)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 15)
                                                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                                )
                                        } placeholder: {
                                            
                                            ProgressView()
                                        }
                    
                    VStack(alignment: .leading, spacing: 15){
                        Text(title)
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("22 Aug 2023")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 15){
                        Text("\(clicks)")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Clicks")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(CustomShape(cornerRadius: 15, topLeft: true, topRight: true))
            
            HStack{
                Text(smartLink)
                    .font(.title3)
                    .foregroundColor(.blue)
                
                Spacer()
                
                Image(systemName: "doc.on.doc")
                    .font(.title3)
                    .foregroundColor(.blue)
            }
            .padding()
            .background(Color.blue.opacity(0.4))
            .clipShape(CustomShape(cornerRadius: 15, bottomLeft: true, bottomRight: true))
        }
        .padding()
    }
}

// Custom Shape to clip specific corners
struct CustomShape: Shape {
    var cornerRadius: CGFloat
    var topLeft: Bool = false
    var topRight: Bool = false
    var bottomLeft: Bool = false
    var bottomRight: Bool = false
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        let x = rect.origin.x
        let y = rect.origin.y
        
        path.move(to: CGPoint(x: x + (topLeft ? cornerRadius : 0), y: y))
        
        if topRight {
            path.addLine(to: CGPoint(x: x + width - cornerRadius, y: y))
            path.addArc(center: CGPoint(x: x + width - cornerRadius, y: y + cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        } else {
            path.addLine(to: CGPoint(x: x + width, y: y))
        }
        
        if bottomRight {
            path.addLine(to: CGPoint(x: x + width, y: y + height - cornerRadius))
            path.addArc(center: CGPoint(x: x + width - cornerRadius, y: y + height - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        } else {
            path.addLine(to: CGPoint(x: x + width, y: y + height))
        }
        
        if bottomLeft {
            path.addLine(to: CGPoint(x: x + cornerRadius, y: y + height))
            path.addArc(center: CGPoint(x: x + cornerRadius, y: y + height - cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        } else {
            path.addLine(to: CGPoint(x: x, y: y + height))
        }
        
        if topLeft {
            path.addLine(to: CGPoint(x: x, y: y + cornerRadius))
            path.addArc(center: CGPoint(x: x + cornerRadius, y: y + cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        } else {
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        return path
    }
}

#Preview {
    LinkTile(title: "YouTube ", originalImage: "https://stock.adobe.com/search?k=youtube+logo", clicks: 1200, smartLink: "https://swayamrustagi22/yo..")
}
