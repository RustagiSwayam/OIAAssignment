//
//  ChartTile.swift
//  OIAProj
//
//  Created by Swayam Rustagi on 08/05/24.
//

import SwiftUI

struct ChartTile: View {
    var body: some View {
        VStack{
            HStack
            {
                Text("Overview")
                    .font(.title2)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                HStack{
                    Text("22 Aug - 23 Sept")
                    
                    Image(systemName: "clock")
                }
                    .font(.footnote)
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay{
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray, lineWidth: 1)
                    }
            }
            
            OIAChartView()
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding()
    }
}

#Preview {
    ChartTile()
}
