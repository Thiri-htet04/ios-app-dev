//
//  NavigationStackDemo.swift
//  model-navigation
//
//  Created by Thiri Htet on 30/08/2025.
//

import SwiftUI

struct NavigationStackDemo: View {
    
    @State var showNextPage: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink("See Detail"){
                    DetailScreen()
                }
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                
                NavigationLink("Go to String Screen", value : "Welcome")
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                
                
                Button("Show Next Page"){
                    showNextPage = true
                }
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            .navigationTitle(Text("Navigation"))
            .navigationDestination(for: String.self) { item in
                StringScreen(value : item)
            }
            
            .navigationDestination(isPresented: $showNextPage) {
                BoolScreen()
            }
            .toolbar {
                ToolbarItem(placement: .secondaryAction){
                    Button("Add"){
                        
                    }
                }
                ToolbarItem{
                    Button {
                        
                    } label : {
                        Image(systemName: "plus")
                    }
                }
            }
            
        }
    }
}



struct DetailScreen : View {
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            
            Text("Detail Screen")
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}


struct StringScreen : View {
    
    var value : String
    
    var body : some View {
        ZStack{
            Color.green
                .ignoresSafeArea()
            Text(value)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
    }
}


struct BoolScreen : View {
    var body : some View {
        ZStack{
            Color.red
                .ignoresSafeArea()
            
            Text("This is Bool Screen")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    NavigationStackDemo()
}
