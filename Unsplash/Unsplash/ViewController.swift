//
//  ViewController.swift
//  Unsplash
//
//  Created by Thiri Htet on 19/07/2025.
//

import UIKit

class ViewController: UIViewController {
    
    var photos: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task{
            await fetchImages()
        }
    }
    
    func fetchImages() async {
        let url = URL(string: "⁦https://api.unsplash.com/photos?page=1&per_page=30⁩")!
        
        var request = URLRequest(url: url)
        //        request.addValue("Client-ID Yt0qe3ACQAQ8Gq4-xfqoValZFi0KZgUJUL-hbkDlrkg", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            switch httpResponse.statusCode {
            case 200:
                photos = try JSONDecoder().decode([Photo].self, from: data)
                print(photos)
            default:
                let errors = try JSONDecoder().decode(ErrorResponse.self, from: data)
                await MainActor.run{
                    showErrorMessage(error: errors)
                }
                
                
            }
            
        } catch {
            print("Error: \(error)")
        }
    }
    
    func showErrorMessage(error: ErrorResponse) {
        let alert = UIAlertController(title: "An error occured", message: error.errors.joined(separator: ", "), preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
        
    }
    
    
}
