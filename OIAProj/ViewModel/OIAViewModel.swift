//
//  OIAViewModel.swift
//  OIAProj
//
//  Created by Swayam Rustagi on 04/05/24.
//

import Foundation

class OIAViewModel: ObservableObject{
    @Published var response: ResponseBody?
    let service: OIAService
     
    init(service: OIAService){
        self.service = service
    }
    
    private func loadResponse(){
        Task{
            do{
                self.response = try await service.getData()
            }catch{
                print("DEBUG: Error while fetching response")
            }
        }
    }
}
