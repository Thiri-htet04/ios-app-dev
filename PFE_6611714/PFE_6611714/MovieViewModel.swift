//
//  MovieViewModel.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//

import Foundation
import Combine

@MainActor
final class MoviesViewModel: ObservableObject {
    enum LoadState { case idle, loading, loaded, failed(Error) }

    @Published var allMovies: [Movie] = []
    @Published var state: LoadState = .idle

    func fetch() {
        state = .loading
        Task {
            do {
                let movies = try await MovieService.fetchAvailableMovies()
                self.allMovies = movies
                self.state = .loaded
            } catch {
                self.state = .failed(error)
            }
        }
    }

    func movies(for segment: MoviesView.Segment) -> [Movie] {
        allMovies.filter { m in
            let flag = m.now_showing?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            return segment == .now ? flag == "1" : flag.isEmpty
        }
    }
}
