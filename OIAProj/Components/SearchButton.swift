//
//  SearchButton.swift
//  OIAProj
//
//  Created by Swayam Rustagi on 08/05/24.
//

import SwiftUI

struct SearchButton: View {
    var body: some View {
        VStack{
            Image(systemName: "magnifyingglass")
                .padding()
                .background(.clear)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                }
        }
    }
}

#Preview {
    SearchButton()
}
