//
//  CinemaViewModel.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//

import Foundation
import Combine

@MainActor
final class CinemasViewModel: ObservableObject {
    enum LoadState { case idle, loading, loaded, failed(Error) }

    @Published var cinemas: [Cinema] = []
    @Published var state: LoadState = .idle
    @Published private(set) var favoriteIDs: Set<String> = []

    private let favKey = "favorite_cinemas_ids_v1"

    init() { loadFavorites() }

    func fetch() {
        state = .loading
        Task {
            do {
                let list = try await CinemaService.fetchCinemas()
                self.cinemas = list
                self.state = .loaded
            } catch {
                self.state = .failed(error)
            }
        }
    }

    // MARK: Favorites
    func isFavorite(_ cinema: Cinema) -> Bool {
        guard let id = cinema.id.nonEmpty else { return false }
        return favoriteIDs.contains(id)
    }

    func toggleFavorite(_ cinema: Cinema) {
        guard let id = cinema.id.nonEmpty else { return }
        if favoriteIDs.contains(id) { favoriteIDs.remove(id) }
        else { favoriteIDs.insert(id) }
        saveFavorites()
    }

    private func loadFavorites() {
        if let arr = UserDefaults.standard.array(forKey: favKey) as? [String] {
            favoriteIDs = Set(arr)
        }
    }
    private func saveFavorites() {
        UserDefaults.standard.set(Array(favoriteIDs), forKey: favKey)
    }
}


