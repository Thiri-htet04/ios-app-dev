//
//  Photo.swift
//  Unsplash
//
//  Created by Thiri Htet on 19/07/2025.
//

import Foundation


struct Photo: Codable {
    var id: String
    var urls: ImageURL?
}

struct ImageURL: Codable {
    var raw: String
    var full: String
    var regular: String
}

struct ErrorResponse: Codable {
    var errors: [String]
}
