//
//  CinemasView.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//

import SwiftUI

struct CinemasView: View {
    @StateObject private var vm = CinemasViewModel()
    @State private var segment: Segment = .all
    
    @State private var selectedCinema: Cinema? = nil
    @State private var sheetDetent: PresentationDetent = .medium

    enum Segment: String, CaseIterable, Identifiable {
        case all = "All Cinemas"
        case fav = "Favorites"
        var id: String { rawValue }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Picker("Filter", selection: $segment) {
                    ForEach(Segment.allCases) { Text($0.rawValue).tag($0) }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                content
            }
            .navigationTitle("Cinemas")
            .task { if case .idle = vm.state { vm.fetch() } }
            .refreshable { vm.fetch() }
        }
        .sheet(item: $selectedCinema) { cinema in
            CinemaDetailView(cinema: cinema)
                .presentationDetents([.medium, .large], selection: $sheetDetent)
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(28)
        }
    }

    @ViewBuilder
    private var content: some View {
        switch vm.state {
        case .idle, .loading:
            ProgressView().padding(.top, 40)

        case .failed(let error):
            VStack(spacing: 8) {
                Text("Failed to load cinemas").bold()
                Text(error.localizedDescription)
                    .font(.footnote).foregroundStyle(.secondary)
                Button("Retry") { vm.fetch() }
                    .buttonStyle(.borderedProminent)
            }.padding(.top, 40)

        case .loaded:
            let list = filteredCinemas()
            if list.isEmpty {
                Text(segment == .fav ? "No favorites yet." : "No cinemas found.")
                    .foregroundStyle(.secondary).padding(.top, 40)
            } else {
                List {
                    ForEach(list) { cinema in
                        CinemaRow(cinema: cinema,
                                  isFavorite: vm.isFavorite(cinema),
                                  onToggle: { vm.toggleFavorite(cinema) }
                        )
                        .contentShape(Rectangle())
                        .onTapGesture { selectedCinema = cinema }
                    }
                }
                .listStyle(.plain)
            }
        }
    }

    private func filteredCinemas() -> [Cinema] {
        switch segment {
        case .all: return vm.cinemas
        case .fav: return vm.cinemas.filter { vm.isFavorite($0) }
        }
    }
}


//#Preview {
//    CinemasView()
//}

