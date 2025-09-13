//
//  todoApp.swift
//  todo
//
//  Created by Thiri Htet on 13/09/2025.
//

import SwiftUI
import SwiftData

@main
struct todoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TodoItem.self)
    }
}
