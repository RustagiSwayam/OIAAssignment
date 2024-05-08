//
//  OIAService.swift
//  OIAProj
//
//  Created by Swayam Rustagi on 04/05/24.
//

import Foundation

class OIAService: ObservableObject {
    
    let endpoint = "https://api.inopenapp.com/api/v1/dashboardNew"
    let bearerToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
    
    enum Errors: Error {
        case invalidUrl
        case networkError
        case unauthorized
        case invalidResponse
        case invalidData
    }
    
    func getData() async throws -> ResponseBody {
        guard let url = URL(string: endpoint) else { throw Errors.invalidUrl }
        
        var request = URLRequest(url: URL(string: "https://api.inopenapp.com/api/v1/dashboardNew")!,timeoutInterval: Double.infinity)
        
        
        request.addValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        request.addValue("connect.sid=s%3AfX4KKapR9K64byDRgutuy4y59po0lIt1.s872rs77qDOSuAPgjQWOwbNrLYKlfhj3v10hzNtC8Gs", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw Errors.invalidResponse
        }
        
        let decoder = JSONDecoder()
        
        switch httpResponse.statusCode {
        case 200:
            do {
                return try decoder.decode(ResponseBody.self, from: data)
            } catch {
                throw Errors.invalidData
            }
        case 401:
            throw Errors.unauthorized
        default:
            throw Errors.invalidResponse
        }
    }
}
