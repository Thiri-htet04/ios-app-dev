//
//  ContentView.swift
//  job-hunter
//
//  Created by Thiri Htet on 06/09/2025.
//

import SwiftUI


struct Job : Decodable {
    var id : String
    var title : String
    var companyName : String
    var category : String
}

struct ContentView: View {
    
    @State var jobs : [Job] = []
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(jobs, id: \.id) { job in
                        VStack(alignment: .leading){
                            Text("Data Scientist")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("DataCrop Analytics")
                                .font(.callout)
                                .foregroundStyle(.white)
                            Text("Software Engineering")
                                .font(.callout)
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.blue.gradient)
                        .clipShape(.rect(cornerRadius: 12))
                    }
                    
                }
                .padding(.horizontal)
            }
            .navigationTitle("JobHunter")
            
        }
        .task {
            
            do{
                jobs = try await fetchJobs()
            }catch{
                
            }
        }
    }
    
    
    func fetchJobs() async throws -> [Job] {
        let url = URL(string: "https://dummyjson.com/c/5328-d10d-45f4-b97f")
        
        if let url {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw AppError.InvalidResponseError
            }
            
            do {
                return try JSONDecoder().decode([Job].self, from: data)
            }catch{
                throw AppError.DecodeError
            }
            
        }else{
            throw AppError.URLError
        }
        
    }
}


enum AppError : Error {
    case URLError
    case InvalidResponseError
    case DecodeError
    
}

#Preview {
    ContentView()
}
