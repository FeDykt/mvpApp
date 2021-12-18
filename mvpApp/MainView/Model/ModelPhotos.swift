//
//  NetworkModel.swift
//  mvpApp
//
//  Created by fedot on 18.12.2021.
//

import Foundation

// MARK: - Photo
struct Photos: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
