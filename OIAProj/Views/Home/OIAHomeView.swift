//
//  OIAHomeView.swift
//  OIAProj
//
//  Created by Swayam Rustagi on 04/05/24.
//

import SwiftUI

enum LinkType {
    case topLinks
    case recentLinks
}

struct OIAHomeView: View {
    
    @StateObject var viewModel = OIAViewModel(service: OIAService())
    @State private var selectedLinkType: LinkType = .topLinks
    
    var body: some View {
        
        ScrollView{
            
            VStack{
                HStack{
                    Text("Dashboard")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    Image(systemName: "gearshape.fill")
                        .foregroundStyle(.white)
                        .frame(width: 50, height: 50)
                        .background(.blue.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
            .padding()
            .background(.blue)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .ignoresSafeArea()
            VStack{
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Good Morning,")
                            .foregroundStyle(.gray)
                            .font(.title3)
                        
                        Text("Swayam Rustagi 👋")
                            .font(.title)
                            .bold()
                    }
                    
                    Spacer()
                }
                .padding()
                
                ChartTile()
                
                ScrollView(.horizontal){
                    HStack{
                        ActivityTile(imageName: "cursorarrow.click", imageColor: .purple, imageBGColor: .indigo, mainInfo: "123", secondaryInfo: "Today's Clicks")
                        
                        ActivityTile(imageName: "location.fill", imageColor: .blue, imageBGColor: .blue, mainInfo: "Ahemdabad", secondaryInfo: "Top Location")
                        
                        ActivityTile(imageName: "globe", imageColor: .red, imageBGColor: .red, mainInfo: "Instagram", secondaryInfo: "Top Source")
                    }
                }
                
                ViewAnalysticsButton()
                
                HStack{
                    Button {
                        selectedLinkType = .topLinks
                    } label: {
                        Text("Top Links")
                            .padding()
                            .font(.title3)
                            .foregroundColor(selectedLinkType == .topLinks ? .white : .gray)
                            .bold()
                            .frame(width: 120, height: 50)
                            .background(selectedLinkType == .topLinks ? Color.blue : Color.clear)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    
                    Button {
                        selectedLinkType = .recentLinks
                    } label: {
                        Text("Recent")
                            .padding()
                            .font(.title3)
                            .foregroundColor(selectedLinkType == .recentLinks ? .white : .gray)
                            .bold()
                            .frame(width: 120, height: 50)
                            .background(selectedLinkType == .recentLinks ? Color.blue : Color.clear)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    
                    Spacer()
                    
                    SearchButton()
                }
                .padding()
                
                if selectedLinkType == .topLinks {
                                    if let topLinks = viewModel.response?.data.topLinks {
                                        ForEach(topLinks) { link in
                                            LinkTile(title: link.title, originalImage: link.originalImage?.absoluteString ?? "", clicks: link.totalClicks, smartLink: link.smartLink)
                                        }
                                    }
                                } else {
                                    if let recentLinks = viewModel.response?.data.recentLinks {
                                        ForEach(recentLinks) { link in
                                            LinkTile(title: link.title, originalImage: link.originalImage?.absoluteString ?? "", clicks: link.totalClicks, smartLink: link.smartLink)
                                        }
                                    }
                                }
                
                ViewAllLinksButton()
                
                TalkWithUsButton()
                
                FAQButton()
                Spacer()
            }
            .background(.gray.opacity(0.1))
        }
    }
}

#Preview {
    OIAHomeView()
}
