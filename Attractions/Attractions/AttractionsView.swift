//
//  AttractionsView.swift
//  Attractions
//
//  Created by Thiri Htet on 16/08/2025.
//

import SwiftUI

struct AttractionsView: View {
    let items =  contents
    
//    var attractions = [AttractionModel(name: "Kew Mae Pan", imageName: "img1"),
//                       AttractionModel(name: "Doi Intnanon", imageName: "img2"),
//                       AttractionModel(name: "Chiang Mai Zoo", imageName: "img3"),
//                       AttractionModel(name: "Wat Phra Suthep", imageName: "img4")]
    
//    var body: some View {
//        
//        NavigationStack {
//            List(attractions){ attraction in
//                NavigationLink{
//                    ContentView()
//                        .navigationTitle(attraction.name)
//                }label:{
//                    AttractionRowView(attraction: attraction)
//                }
//                
//            }
//            .navigationTitle(Text("Chiang Mai Attractions"))
//        }
//    }
    
    var body: some View {
            NavigationStack {
                List(items) { item in
                    NavigationLink {
                        ContentView(content: item)
                    } label: {
                        HStack {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            Text(item.name)
                            Spacer()
                        }
                    }
                }
                .navigationTitle("Chiang Mai Attractions")
            }
        }
}

#Preview {
    AttractionsView()
}
