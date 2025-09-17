//
//  RecipeDetailLoader.swift
//  cookmate
//
//  Created by Thiri Htet on 17/09/2025.
//

//import SwiftUI
//
//struct RecipeDetailLoader: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    RecipeDetailLoader()
//}


import SwiftUI

struct RecipeDetailLoader: View {
    let recipeID: Int
    
    @State private var recipe: Recipe?
    @State private var showURLError = false
    @State private var showInvalidResponseError = false
    @State private var showDecodeError = false
    
    var body: some View {
        Group {
            if let recipe {
                RecipeDetailView(recipe: recipe)
            } else {
                VStack(spacing: 12) {
                    ProgressView()
                    Text("Loading recipe…").font(.footnote).foregroundStyle(.secondary)
                }
            }
        }
        .task {
            do {
                recipe = try await RecipesAPI.fetchRecipe(id: recipeID)
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
