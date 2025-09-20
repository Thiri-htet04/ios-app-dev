//
//  Cinema.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//


import Foundation

public struct Cinema: Identifiable, Decodable {
    public let cinema_id: String?
    public let cinema_name_en: String?
    public let zone_name_en: String?
    public let brand_name_en: String?

  
    public let cinema_tel: String?
    public let cinema_content_main: String?
    public let cinema_office_hour_en: String?

    public var id: String { cinema_id ?? cinema_name_en ?? UUID().uuidString }

    enum CodingKeys: String, CodingKey {
        case cinema_id, cinema_name_en, zone_name_en, brand_name_en
        case cinema_tel, cinema_content_main, cinema_office_hour_en
    }

    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        func S(_ k: CodingKeys) -> String? {
            if let s = try? c.decode(String.self, forKey: k) { return s }
            if let i = try? c.decode(Int.self, forKey: k) { return String(i) }
            if let d = try? c.decode(Double.self, forKey: k) {
                let i = Int(d); return d == Double(i) ? String(i) : String(d)
            }
            return nil
        }
        cinema_id              = S(.cinema_id)
        cinema_name_en         = S(.cinema_name_en)
        zone_name_en           = S(.zone_name_en)
        brand_name_en          = S(.brand_name_en)
        cinema_tel             = S(.cinema_tel)
        cinema_content_main    = S(.cinema_content_main)
        cinema_office_hour_en  = S(.cinema_office_hour_en)
    }
}
