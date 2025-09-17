//
//  cookmateApp.swift
//  cookmate
//
//  Created by Thiri Htet on 16/09/2025.
//

import SwiftUI

@main
struct cookmateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: FavoriteRecipe.self)
    }
}
