//
//  RecipeModel.swift
//  cookmate
//
//  Created by Thiri Htet on 16/09/2025.
//

import Foundation

import SwiftData

enum AppError: Error {
    case URLError
    case InvalidResponseError
    case DecodeError
}

struct RecipesResponse: Decodable {
    let recipes: [Recipe]
    let total: Int
    let skip: Int
    let limit: Int
}


struct Recipe : Decodable, Hashable, Identifiable {
    var id: Int
    var name: String
    var image: String
    var ingredients: [String]
    var instructions: [String]
    var prepTimeMinutes: Int
    var cookTimeMinutes: Int
    var servings: Int
    var difficulty: String
    var cuisine: String
    var caloriesPerServing: Int
    var tags: [String]
    var rating: Double
    var reviewCount: Int
    var mealType: [String]
}

@Model
final class FavoriteRecipe {
    @Attribute(.unique) var id: Int
    var name: String
    var image: String

    init(id: Int, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}

//struct RecipesAPI {
//    static func fetchRecipes(id: Int) async throws -> [Recipe] {
//        guard let url = URL(string: "https://dummyjson.com/recipes/\(id)") else {
//            throw AppError.URLError
//        }
//
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
//            throw AppError.InvalidResponseError
//        }
//
//        do {
//            let decoder = JSONDecoder()
//            let resp = try decoder.decode(RecipesResponse.self, from: data)
//            return resp.recipes
//        } catch {
//            throw AppError.DecodeError
//        }
//    }
//}


struct RecipesAPI {

    // 1) List endpoint: /recipes  →  RecipesResponse { recipes: [Recipe], ... }
    static func fetchRecipes() async throws -> [Recipe] {
        guard let url = URL(string: "https://dummyjson.com/recipes") else {
            throw AppError.URLError
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw AppError.InvalidResponseError
        }
        do {
            let resp = try JSONDecoder().decode(RecipesResponse.self, from: data)
            return resp.recipes
        } catch {
            throw AppError.DecodeError
        }
    }

    // 2) Detail endpoint: /recipes/{id}  →  Recipe (single object)
    static func fetchRecipe(id: Int) async throws -> Recipe {
        guard let url = URL(string: "https://dummyjson.com/recipes/\(id)") else {
            throw AppError.URLError
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw AppError.InvalidResponseError
        }
        do {
            let recipe = try JSONDecoder().decode(Recipe.self, from: data)
            return recipe
        } catch {
            throw AppError.DecodeError
        }
    }
}




