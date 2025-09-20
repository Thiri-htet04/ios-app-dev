//
//  CinemaRow.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//

import SwiftUI

struct CinemaRow: View {
    let cinema: Cinema
    let isFavorite: Bool
    let onToggle: () -> Void

    var body: some View {
        HStack(spacing: 14) {
            
            Image(
                CinemaAssets.imageName(
                    zone:  cinema.zone_name_en,
                    brand: cinema.brand_name_en,
                    name:  cinema.cinema_name_en
                ))
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.gray.opacity(0.2)))

            VStack(alignment: .leading, spacing: 4) {
                Text(cinema.cinema_name_en?.nonEmpty ?? "—")
                    .font(.headline)
                Text(cinema.zone_name_en?.nonEmpty ?? "—")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text(cinema.brand_name_en?.nonEmpty ?? "—")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button(action: onToggle) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .imageScale(.large)
                    .foregroundStyle(isFavorite ? .yellow : .secondary)
                    .accessibilityLabel(isFavorite ? "Unfavorite" : "Favorite")
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 6)
    }

    // MARK: - Zone → Asset mapping
    private func zoneAssetName(for cinema: Cinema) -> String {
        let zone = (cinema.zone_name_en ?? "").lowercased()
        let brand = (cinema.brand_name_en ?? "").lowercased()

        if zone.contains("paragon") { return "paragon" }
        if zone.contains("icon")    { return "icon" }
        if zone.contains("quartier") { return "emq" }
        if zone.contains("imax") || brand.contains("imax") { return "imax" }
        return "major"
    }
}

//#Preview {
//    CinemaRow()
//}
