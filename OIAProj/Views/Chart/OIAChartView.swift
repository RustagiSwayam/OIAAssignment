//
//  OIAChartView.swift
//  OIAProj
//
//  Created by Swayam Rustagi on 08/05/24.
//

import SwiftUI
import Charts


struct ClickPM: Identifiable{
    var id = UUID()
    let month: String
    let value: Int
}

struct OIAChartView: View {
    
    let click: [ClickPM] = [
    ClickPM(month: "Jan", value: 20),
    ClickPM(month: "Feb", value: 40),
    ClickPM(month: "March", value: 100),
    ClickPM(month: "Apr", value: 56),
    ClickPM(month: "May", value: 11),
    ClickPM(month: "Jun", value: 29),
    ClickPM(month: "Jul", value: 90),
    ClickPM(month: "Aug", value: 45),
//    ClickPM(month: "September", value: 54),
//    ClickPM(month: "October", value: 89),
//    ClickPM(month: "November", value: 22),
//    ClickPM(month: "December", value: 13)
    ]
    
    var body: some View {
            
                Chart(click) { clicks in
                        LineMark(
                          x: .value("Months", clicks.month),
                          y: .value("Clicks", clicks.value)
                        )
                        .shadow(color: .blue, radius: 3, x: 2, y: 0) // Add shadow effect
                      }
                      .frame(height: 200)
    }
}

#Preview {
    OIAChartView()
}
