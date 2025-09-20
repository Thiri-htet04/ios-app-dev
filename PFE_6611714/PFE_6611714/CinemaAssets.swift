//
//  CinemaAssets.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//


import Foundation

enum CinemaAssets {

    static func imageName(zone: String?, brand: String?, name: String? = nil) -> String {
       
        let raw = [zone, brand, name]
            .compactMap { $0?.lowercased() }
            .joined(separator: " ")

        let folded = raw.folding(options: [.diacriticInsensitive, .widthInsensitive, .caseInsensitive],
                                 locale: .current)
        let tight  = folded.replacingOccurrences(of: "[^a-z0-9]+",
                                                 with: "",
                                                 options: .regularExpression)

        func has(_ keywords: [String]) -> Bool {
            keywords.contains { k in raw.contains(k) || folded.contains(k) || tight.contains(k.replacingOccurrences(of: " ", with: "")) }
        }

   
        if has(["imax", "imaxlaser", "imax with laser"]) { return "imax" }

        if has(["paragon", "siam paragon", "siamparagon"]) { return "paragon" }
  
        if has(["icon", "iconsiam", "cineconic", "icon cineconic", "icon cineart", "iconcineconic", "iconcineart"]) {
            return "icon"
        }

        if has(["quartier", "emquartier", "emq", "quartier cineart", "the emquartier"]) {
            return "emq"
        }


        return "major"
    }
}


