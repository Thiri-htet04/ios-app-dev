//
//  ContentView.swift
//  cookmate
//
//  Created by Thiri Htet on 16/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var recipes: [Recipe] = []

    @State private var showURLError = false
    @State private var showInvalidResponseError = false
    @State private var showDecodeError = false

    private let columns = [GridItem(.flexible(), spacing: 16),
                           GridItem(.flexible(), spacing: 16)]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(recipes) { recipe in
                        NavigationLink(value: recipe) {
                            RecipeCard(recipe: recipe)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
            }
            .navigationTitle("CookMate")
            .toolbar {
                NavigationLink {
                    FavoritesView()
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                .accessibilityLabel("Favorites")
            }
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetailView(recipe: recipe)
            }
        }
        .task {
            do {
                recipes = try await RecipesAPI.fetchRecipes()
            } catch {
                guard let e = error as? AppError else { return }
                switch e {
                case .URLError: showURLError = true
                case .InvalidResponseError: showInvalidResponseError = true
                case .DecodeError: showDecodeError = true
                }
            }
        }
        .alert("Invalid URL", isPresented: $showURLError) { Button("OK") {} }
        .alert("Invalid Response", isPresented: $showInvalidResponseError) { Button("OK") {} }
        .alert("Decoding Failed", isPresented: $showDecodeError) { Button("OK") {} }
    }
}


private struct RecipeCard: View {
    let recipe: Recipe

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: recipe.image)) { phase in
                switch phase {
                case .empty: Rectangle().opacity(0.1)
                case .success(let img): img.resizable().scaledToFill()
                case .failure: Rectangle().opacity(0.1)
                @unknown default: Rectangle().opacity(0.1)
                }
            }
            .frame(height: 140)
            .frame(maxWidth: .infinity)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 14))

            Text(recipe.name)
                .font(.subheadline)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ContentView()
}
