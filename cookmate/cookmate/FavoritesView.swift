//
//  FavoritesView.swift
//  cookmate
//
//  Created by Thiri Htet on 16/09/2025.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query(sort: [SortDescriptor(\FavoriteRecipe.name, order: .forward)])
    private var favorites: [FavoriteRecipe]

    private let columns = [GridItem(.flexible(), spacing: 16),
                           GridItem(.flexible(), spacing: 16)]

    var body: some View {
        ScrollView {
            if favorites.isEmpty {
                ContentUnavailableView("No Favorites",
                                       systemImage: "heart",
                                       description: Text("Tap **Favorite** on a recipe to save it here."))
                    .padding(.top, 40)
            } else {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(favorites, id: \.id) { fav in
                        NavigationLink {
                            // Load full recipe detail by ID
                            RecipeDetailLoader(recipeID: fav.id)
                        } label: {
                            VStack(alignment: .leading, spacing: 8) {
                                AsyncImage(url: URL(string: fav.image)) { phase in
                                    switch phase {
                                    case .empty: Rectangle().opacity(0.1)
                                    case .success(let image): image.resizable().scaledToFill()
                                    case .failure: Rectangle().opacity(0.1)
                                    @unknown default: Rectangle().opacity(0.1)
                                    }
                                }
                                .frame(height: 140)
                                .frame(maxWidth: .infinity)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 14))

                                Text(fav.name)
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
            }
        }
        .navigationTitle("Favorites")
        .navigationBarTitleDisplayMode(.large)
    }
}


#Preview {
    FavoritesView()
}
