//
//  OIAModel.swift
//  OIAProj
//
//  Created by Swayam Rustagi on 03/05/24.
//

import Foundation

struct Link: Codable, Identifiable {
    let id: UUID = UUID()
    let urlId: Int
    let webLink: URL
    let smartLink: String
    let title: String
    let totalClicks: Int
    let originalImage: URL?
    let thumbnail: URL?
    let timesAgo: String
    let createdAt: Date
    let domainId: String
    let urlPrefix: String?
    let urlSuffix: String
    let app: String
    let isFavourite: Bool
    
    enum CodingKeys: String, CodingKey {
        case urlId = "url_id"
        case webLink = "web_link"
        case smartLink = "smart_link"
        case title
        case totalClicks = "total_clicks"
        case originalImage = "original_image"
        case thumbnail
        case timesAgo = "times_ago"
        case createdAt = "created_at"
        case domainId = "domain_id"
        case urlPrefix = "url_prefix"
        case urlSuffix = "url_suffix"
        case app
        case isFavourite = "is_favourite"
    }
}

struct DataContainer: Codable{
    let recentLinks: [Link]
    let topLinks: [Link]
    let favouriteLinks: [Link]
    
    enum CodingKeys: String, CodingKey {
        case recentLinks = "recent_links"
        case topLinks = "top_links"
        case favouriteLinks = "favourite_links"
    }
}

struct ResponseBody: Codable {
    let status: Bool
    let statusCode: Int
    let message: String
    let supportWhatsappNumber: String
    let extraIncome: Float
    let totalLinks: Int
    let totalClicks: Int
    let todayClicks: Int
    let topSource: String
    let topLocation: String
    let startTime: String
    let linksCreatedToday: Int
    let appliedCampaign: Int
    let data: DataContainer
    
    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case message
        case supportWhatsappNumber = "support_whatsapp_number"
        case extraIncome = "extra_income"
        case totalLinks = "total_links"
        case totalClicks = "total_clicks"
        case todayClicks = "today_clicks"
        case topSource = "top_source"
        case topLocation = "top_location"
        case startTime = "startTime"
        case linksCreatedToday = "links_created_today"
        case appliedCampaign = "applied_campaign"
        case data
    }
}

