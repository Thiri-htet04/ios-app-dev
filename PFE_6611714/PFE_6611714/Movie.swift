//
//  Movie.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//
import Foundation

public struct Movie: Identifiable, Decodable {
    public let movie_id: String?
    public let poster_url: String?
    public let widescreen_url: String?
    public let title_en: String?
    public let poster_en: String?
    public let release_date: String?
    public let duration: String?
    public let genre: String?
    public let synopsis_en: String?
    public let tr_mp4: String?
    public let now_showing: String?

    public var id: String { movie_id ?? title_en ?? poster_en ?? poster_url ?? UUID().uuidString }

    enum CodingKeys: String, CodingKey {
        case movie_id, poster_url, widescreen_url, title_en, poster_en,
             release_date, duration, genre, synopsis_en, tr_mp4, now_showing
    }

    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        func readString(_ key: CodingKeys) -> String? {
            if let s = try? c.decode(String.self, forKey: key) { return s }
            if let i = try? c.decode(Int.self, forKey: key) { return String(i) }
            if let d = try? c.decode(Double.self, forKey: key) {
                let intPart = Int(d)
                return (d == Double(intPart)) ? String(intPart) : String(d)
            }
            return nil
        }

        self.movie_id       = readString(.movie_id)
        self.poster_url     = readString(.poster_url)
        self.widescreen_url = readString(.widescreen_url)
        self.title_en       = readString(.title_en)
        self.poster_en      = readString(.poster_en)
        self.release_date   = readString(.release_date)
        self.duration       = readString(.duration)
        self.genre          = readString(.genre)
        self.synopsis_en    = readString(.synopsis_en)
        self.tr_mp4         = readString(.tr_mp4)
        self.now_showing    = readString(.now_showing)
    }
}

public extension String {
    var nonEmpty: String? {
        let t = trimmingCharacters(in: .whitespacesAndNewlines)
        return t.isEmpty ? nil : t
    }
}
