//
//  MovieDetailView.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @State private var showTrailer = false

    var body: some View {
        ScrollView {
          
            ZStack {

                PosterView(imageURLString: movie.widescreen_url ?? movie.poster_url)
                    .frame(maxWidth: .infinity)
                    .frame(height: 210)
                    .clipShape(RoundedRectangle(cornerRadius: 0))
                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(.gray.opacity(0.2)))

                if let trailerURL = trailerURL {
                    Button {
                        showTrailer = true
                    } label: {
                        ZStack {
                            Circle().fill(.black.opacity(0.55)).frame(width: 56, height: 56)
                            Image(systemName: "play.fill").foregroundStyle(.white)
                        }
                    }
                    .accessibilityLabel("Play trailer")
                } else {
                    ZStack {
                        Circle().fill(.black.opacity(0.15)).frame(width: 56, height: 56)
                        Image(systemName: "play.fill").foregroundStyle(.white.opacity(0.6))
                    }
                }
            }

  
            VStack(spacing: 6) {
                Text(movie.title_en?.nonEmpty ?? "Untitled")
                    .font(.largeTitle).bold()
                    .multilineTextAlignment(.center)

                Text(movie.genre?.nonEmpty ?? "Unknown Genre")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 10)


            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Release Date").font(.headline)
                    Text(formattedDate(movie.release_date)).foregroundStyle(.secondary)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 2) {
                    Text("Runtime").font(.headline)
                    Text(runtimeText).foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal)
            .padding(.top, 14)

            VStack(alignment: .leading, spacing: 8) {
                Text(movie.synopsis_en?.nonEmpty ?? "No synopsis available.")
                    .font(.body)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal)
            .padding(.top, 18)
            .padding(.bottom, 40)
        }
        .sheet(isPresented: $showTrailer) {
            if let url = trailerURL {
                TrailerPlayerView(url: url)
                    .ignoresSafeArea()
            }
        }
    }

    // MARK: - Helpers
    private var trailerURL: URL? {
        if let s = movie.tr_mp4?.nonEmpty, let url = URL(string: s) { return url }
        return nil
    }

    private var runtimeText: String {
        if let s = movie.duration?.nonEmpty, let m = Int(s) { return "\(m) mins." }
        return movie.duration?.nonEmpty ?? "—"
    }

    private func formattedDate(_ raw: String?) -> String {
        guard let raw = raw?.nonEmpty else { return "—" }
        let in1 = DateFormatter(); in1.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let in2 = DateFormatter(); in2.dateFormat = "yyyy-MM-dd"
        let out = DateFormatter(); out.dateFormat = "d MMM yyyy"
        if let d = in1.date(from: raw) ?? in2.date(from: raw) { return out.string(from: d) }
        return raw
    }
}



private struct PosterView: View {
    let imageURLString: String?

    var body: some View {
        if let raw = imageURLString?.nonEmpty,
           let url = normalizeToHTTPS(raw) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ZStack { Rectangle().fill(.gray.opacity(0.08)); ProgressView() }
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

    private func normalizeToHTTPS(_ s: String) -> URL? {
        var str = s.trimmingCharacters(in: .whitespacesAndNewlines)
        if str.hasPrefix("//") { str = "https:" + str }
        if str.hasPrefix("http://") { str = "https://" + str.dropFirst(7) } 
        str = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? str
        return URL(string: str)
    }

    private var placeholder: some View {
        ZStack {
            Rectangle().fill(.gray.opacity(0.08))
            Image(systemName: "play.rectangle").imageScale(.large).foregroundStyle(.secondary)
        }
    }
}

//
//#Preview {
//    MovieDetailView()
//}
