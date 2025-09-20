//
//  MovieCard.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//


import SwiftUI

struct MovieCard: View {
    let movie: Movie
    

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            poster
                .frame(height: 220)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.15))
                }

//            Text(movie.release_date?.nonEmpty ?? "—")
            Text(formattedDate(movie.release_date))
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(height: 14, alignment: .leading)

            Text(movie.title_en?.nonEmpty ?? "Untitled")
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)
                .minimumScaleFactor(0.9)
                .lineSpacing(-4)
                .fixedSize(horizontal: false, vertical: true)
                .frame(height: 32, alignment: .topLeading)
//                .frame(minHeight: 32, maxHeight: 32, alignment: .topLeading)
                .multilineTextAlignment(.leading)

            Text(movie.genre?.nonEmpty ?? "Unknown Genre")
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .frame(height: 16, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
    }
    
    private func formattedDate(_ raw: String?) -> String {
        guard let raw = raw?.nonEmpty else { return "—" }
        // Try "yyyy-MM-dd HH:mm:ss" then "yyyy-MM-dd"
        let in1 = DateFormatter(); in1.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let in2 = DateFormatter(); in2.dateFormat = "yyyy-MM-dd"
        let out = DateFormatter(); out.dateFormat = "d MMM yyyy"
        if let d = in1.date(from: raw) ?? in2.date(from: raw) { return out.string(from: d) }
        return raw
    }

    @ViewBuilder
    private var poster: some View {
        if let urlString = movie.poster_url?.nonEmpty,
           let url = URL(string: urlString) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Rectangle().fill(.gray.opacity(0.08))
                        ProgressView()
                    }
                case .success(let image):
                    image.resizable().scaledToFill()
                case .failure:
                    placeholder
                @unknown default:
                    placeholder
                }
            }
        } else {
            placeholder
        }
    }

    private var placeholder: some View {
        ZStack {
            Rectangle().fill(.gray.opacity(0.08))
            Image(systemName: "film")
                .imageScale(.large)
                .foregroundStyle(.secondary)
        }
        .clipped()
    }
}


//#Preview {
//    MovieCard()
//}

