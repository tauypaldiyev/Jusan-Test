//
//  NewsDTO.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import SwiftDate

public struct NewsDTO: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
    
    // MARK: - Properties
    public let source: SourceDTO?
    public let author: String?
    public let title: String?
    public let description: String?
    public let url: URL?
    public let urlToImage: URL?
    public let publishedAt: Date?
    public let content: String?
    
    // MARK: - Init
    public init?(json: JSON) {
        self.source = SourceDTO(json: json[CodingKeys.source.rawValue] as? JSON ?? [:])
        self.author = json[CodingKeys.author.rawValue] as? String
        self.title = json[CodingKeys.title.rawValue] as? String
        self.description = json[CodingKeys.description.rawValue] as? String
        self.url = URL(string: json[CodingKeys.url.rawValue] as? String ?? "")
        self.urlToImage = URL(string: json[CodingKeys.urlToImage.rawValue] as? String ?? "")
        self.publishedAt = (json[CodingKeys.urlToImage.rawValue] as? String)?.toISODate()?.date
        self.content = json[CodingKeys.content.rawValue] as? String
    }
        
}
