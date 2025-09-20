//
//  CinemaDetailView.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//

import SwiftUI

struct CinemaDetailView: View {
    let cinema: Cinema

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
         
                Image(CinemaAssets.imageName(zone: cinema.zone_name_en,
                                             brand: cinema.brand_name_en))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 96, height: 96)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(.gray.opacity(0.2)))

            
                VStack(spacing: 6) {
                    Text(cinema.cinema_name_en?.nonEmpty ?? "—")
                        .font(.largeTitle).bold()
                        .multilineTextAlignment(.center)
                    Text(cinema.zone_name_en?.nonEmpty ?? "")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

              
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Office Hours").font(.caption)
                        Text(cinema.cinema_office_hour_en?.nonEmpty ?? "—")
                            .foregroundStyle(.primary).bold()
                            .monospacedDigit()
                            .lineLimit(1)
                            .minimumScaleFactor(0.85)
                                .allowsTightening(true)
                            .multilineTextAlignment(.center)
                           
                    }
                    .frame(maxWidth: .infinity)

                    VStack( spacing: 4) {
                        Text("Phone Number").font(.caption)
                        if let tel = cinema.cinema_tel?.nonEmpty {
                            Text(tel)
                                .foregroundStyle(.primary).bold()
                                .monospacedDigit()
                                .lineLimit(1)
                                .minimumScaleFactor(0.85)
                                    .allowsTightening(true)
                                .multilineTextAlignment(.center)
                        } else {
                            Text("—").foregroundStyle(.secondary)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)


                if let brand = cinema.brand_name_en?.nonEmpty {
                    Text(brand)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                if let html = cinema.cinema_content_main?.nonEmpty {
                    HTMLView(html: html)
                        .frame(minHeight: 300) 
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.top, 8)
                } else {
                    Text("No detail available.")
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            .padding(.bottom, 24)
        }
        .navigationTitle("Cinema Detail")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func openTel(_ num: String) {
        let digits = num.replacingOccurrences(of: " ", with: "")
        if let url = URL(string: "tel://\(digits)"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

//#Preview {
//    CinemaDetailView()
//}
