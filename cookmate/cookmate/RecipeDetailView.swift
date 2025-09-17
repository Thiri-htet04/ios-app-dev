//
//  RecipeDetailView.swift
//  cookmate
//
//  Created by Thiri Htet on 16/09/2025.
//

import SwiftUI
import SwiftData

struct RecipeDetailView: View {
    let recipe: Recipe

    @Environment(\.modelContext) private var context
    @Query private var favorites: [FavoriteRecipe]
    @State private var isFav: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string: recipe.image)) { phase in
                        switch phase {
                        case .empty: Rectangle().opacity(0.1)
                        case .success(let image): image.resizable().scaledToFill()
                        case .failure: Rectangle().opacity(0.1)
                        @unknown default: Rectangle().opacity(0.1)
                        }
                    }
                    .frame(height: 240)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 18))

                    Text("⚡️ \(recipe.caloriesPerServing) cal")
                        .font(.footnote)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(.ultraThinMaterial, in: Capsule())
                        .padding(12)
                }
                
                Text(recipe.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(3)

                
                if !(recipe.tags.isEmpty && recipe.mealType.isEmpty) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(([recipe.cuisine] + recipe.mealType + recipe.tags).unique(), id: \.self) { tag in
                                Text(tag)
                                    .font(.subheadline)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(Color.secondary.opacity(0.15))
                                    .clipShape(Capsule())
                            }
                        }
                        .padding(.vertical, 2)
                    }
                }

                Group {
                    Text("Ingredients").font(.title2)
                    VStack(alignment: .leading, spacing: 6) {
                        ForEach(recipe.ingredients, id: \.self) { item in
                            Text("• \(item)")
                        }
                    }
                }
                
//                Group {
//                    Text("Ingredients").font(.headline)
//                    VStack(alignment: .leading, spacing: 6) {
//                        ForEach(recipe.ingredients, id: \.self) { item in
//                            Text(item)
//                        }
//                    }
//                }


                Group {
                    Text("Instructions").font(.title2)
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(Array(recipe.instructions.enumerated()), id: \.offset) { (idx, step) in
                            Text(step)
                                .padding(12)
                                .background(Color.secondary.opacity(0.12))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
//                                .overlay(alignment: .topLeading) {
//                                    Text("\(idx + 1)")
//                                        .font(.caption2)
//                                        .padding(6)
//                                }
                        }
                    }
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
//                Button(isFav ? "Unfavorite" : "Favorite") {
//                    toggleFavorite()
//                }
//                .buttonStyle(.borderedProminent)
                
                Button {
                            toggleFavorite()
                } label: {
                    Text(isFav ? "Unfavorite" : "Favorite")
                        .font(.subheadline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color(.systemGray5))
                        .clipShape(Capsule())
                }
            }
        }
        
        .onAppear { isFav = favorites.contains(where: { $0.id == recipe.id }) }
    }


    private func toggleFavorite() {
        if isFav {
            if let existing = favorites.first(where: { $0.id == recipe.id }) {
                context.delete(existing)
                try? context.save()
            }
            isFav = false
        } else {
            let fav = FavoriteRecipe(id: recipe.id, name: recipe.name, image: recipe.image)
            context.insert(fav)
            try? context.save()
            isFav = true
        }
    }

}


private extension Array where Element: Hashable {
    
    func unique() -> [Element] {
        var seen = Set<Element>()
        var ordered: [Element] = []
        for e in self where seen.insert(e).inserted {
            ordered.append(e)
        }
        return ordered
    }
}



