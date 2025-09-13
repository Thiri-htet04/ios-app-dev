//
//  ContentView.swift
//  todo
//
//  Created by Thiri Htet on 13/09/2025.
//


import SwiftUI
import SwiftData

@Model
class TodoItem {
    var title: String
    var dateTime: Date
    var isCompleted: Bool
    
    init(title: String, dateTime: Date, isCompleted: Bool) {
        self.title = title
        self.dateTime = dateTime
        self.isCompleted = isCompleted
    }
    
}

struct ContentView: View {
    @Query(sort: \TodoItem.dateTime, order: .reverse) var items: [TodoItem]
    @State var showCreateTodo = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List { 
                ForEach(items) {item in
                    HStack {
                        Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(.primary)
                            .onTapGesture {
                                item.isCompleted.toggle()
                            }
                        
                        Text(item.title)
                        Spacer()
                        Text(item.dateTime.formatted(date: .numeric, time: .shortened))
                    }
                }
                .onDelete{indexSet in
                    for index in indexSet {
                        modelContext.delete(items[index])
                    }
                    
                }
                
            }
            .navigationTitle("Todo List")
            .toolbar {
                ToolbarItem {
                    Button {
                        showCreateTodo = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showCreateTodo) {
                CreateTodoScreen()
            }
        }
    }
}

struct CreateTodoScreen: View {
    @State var newTodoTitle = ""
    @State var newTodoDateTime = Date()
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                TextField("New Todo", text: $newTodoTitle)
                DatePicker("Date Time", selection: $newTodoDateTime)
                
                Section {
                    Button("Create") {
                        let newTodoItem = TodoItem(title: newTodoTitle, dateTime: newTodoDateTime, isCompleted: false)
                        modelContext.insert(newTodoItem)
                        dismiss()
                    }
                }
                
            }
        }
    }
}


#Preview {
    ContentView()
}
