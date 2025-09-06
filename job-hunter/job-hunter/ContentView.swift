//
//  ContentView.swift
//  job-hunter
//
//  Created by Thiri Htet on 06/09/2025.
//

import SwiftUI


struct Job : Decodable, Hashable {
    var id : String
    var title : String
    var companyName : String
    var category : String
    var employmentType : String
    var description : String
    var location : JobLocation
    var skills : [String]
    var salary : JobSalary
}

struct JobLocation : Decodable, Hashable {
    var city : String?
    var country : String?
    
    var locationFormatted : String {
        if let city {
            if let country {
                return "\(city), \(country)"
            }
            return city
        }
        return "-"
    }
}


struct JobSalary: Decodable, Hashable {
    var min : Int
    var max : Int
    var currency : String
    
    var salaryFormatted : String {
        return "\(min.formatted())-\(max.formatted()) \(currency)"
    }
}

struct ContentView: View {
    
    @State var jobs : [Job] = []
    
    @State var showURLError = false
    
    @State var showInvalidResponseError = false
    
    @State var showDecodeError = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(jobs, id: \.id) { job in
                        
                        NavigationLink(value: job){
                            VStack(alignment: .leading){
                                Text(job.title)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                Text(job.companyName)
                                    .font(.callout)
                                    .foregroundStyle(.white)
                                Text(job.category)
                                    .font(.callout)
                                    .foregroundStyle(.white)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.blue.gradient)
                            .clipShape(.rect(cornerRadius: 12))
                        }
                        
                    }
                    
                }
                .padding(.horizontal)
            }
            .navigationTitle("JobHunter")
            .navigationDestination(for: Job.self) { job in
                JobDetail(job: job)
            }
            
        }
        .task {
            
            do{
                jobs = try await fetchJobs()
            }catch{
                guard let error = error  as? AppError else {return}
                
                switch error {
                case .URLError:
                    showURLError = true
                case .InvalidResponseError:
                    showInvalidResponseError = true
                case .DecodeError:
                    showDecodeError = true
                }
            }
        }
        
        .alert("Invalid URL", isPresented: $showURLError) {
            Button("OK") {}
        } message: {
            Text("Please try again later")
        }
        
        .alert("Invalid Response", isPresented: $showInvalidResponseError) {
            Button("OK") {}
        } message: {
            Text("Please try again later")
        }
        
        
        .alert("Decoding Failed", isPresented: $showDecodeError) {
            Button("OK") {}
        } message: {
            Text("Please try again later")
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


struct JobDetail: View {
    var job: Job

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // === Header ===
                VStack(alignment: .leading) {
                    Text("Full-time") // can be job.employmentType
                        .font(.callout)

                    Text(job.title)
                        .font(.title)
                        .fontWeight(.semibold)

                    Text(job.companyName)
                        .font(.title2)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(job.skills, id: \.self) { skill in
                            Text(skill)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(.blue.gradient)
                                .foregroundStyle(.white)
                                .clipShape(Capsule())
                        }
                    }
                }
                .scrollIndicators(.never)

                VStack(alignment: .leading) {
                    Text("Location")
                        .font(.callout)
                        .fontWeight(.semibold)

                    Text(job.location.locationFormatted)
                }

                VStack(alignment: .leading) {
                    Text("Job Description")
                        .font(.callout)
                        .fontWeight(.semibold)

                    Text(job.description)
                        .fixedSize(horizontal: false, vertical: true)
                }

             
                VStack(alignment: .leading) {
                    Text("Salary")
                        .font(.callout)
                        .fontWeight(.semibold)

                    Text(job.salary.salaryFormatted)
                }
            }
            .padding()
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
