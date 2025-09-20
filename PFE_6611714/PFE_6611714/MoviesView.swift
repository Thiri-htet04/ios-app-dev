//
//  MoviesView.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//

import SwiftUI


struct MoviesView: View {
    @StateObject private var vm = MoviesViewModel()
    @State private var segment: Segment = .now
    @State private var selectedMovie: Movie?
    
    private let columns = [GridItem(.flexible(), spacing: 16),
                           GridItem(.flexible(), spacing: 16)]
    
    enum Segment: String, CaseIterable, Identifiable {
        case now = "Now Showing"
        case upcoming = "Upcoming"
        var id: String { rawValue }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Picker("Segment", selection: $segment) {
                    ForEach(Segment.allCases) { Text($0.rawValue).tag($0) }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                content
            }
            .navigationTitle("Minor Cineplex")
            .task { if case .idle = vm.state { vm.fetch() } }
            .refreshable { vm.fetch() }
        }
        .sheet(item: $selectedMovie) { movie in
                MovieDetailView(movie: movie)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
    }
    
    @ViewBuilder
    private var content: some View {
        switch vm.state {
        case .idle, .loading:
            ProgressView().padding(.top, 40)
            
        case .failed(let error):
            VStack(spacing: 10) {
                Text("Failed to load movies").bold()
                Text(error.localizedDescription)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                Button("Retry") { vm.fetch() }
                    .buttonStyle(.borderedProminent)
            }
            .padding(.top, 40)
            
        case .loaded:
            let filtered = vm.movies(for: segment)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(filtered) { movie in
                        MovieCard(movie: movie)
                            .onTapGesture { selectedMovie = movie }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 24)
                
                if filtered.isEmpty {
                    VStack(spacing: 6) {
                        Text("No movies to show").font(.callout)
                        Text(segment == .now ? "Try Upcoming" : "Try Now Showing")
                            .foregroundStyle(.secondary)
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 40)
                }
            }
        }
        
    }
}


//#Preview {
//    MoviesView()
//}
