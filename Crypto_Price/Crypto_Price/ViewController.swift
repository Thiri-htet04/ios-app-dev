//
//  ViewController.swift
//  Crypto_Price
//
//  Created by Thiri Htet on 25/07/2025.
//

import UIKit

class ViewController: UIViewController {
    
    var coins: [Coin] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func requestData(){
        var urlComponents = URLComponents(string: "https://api.coingecko.com/api/v3/coins/markets")
        
        
//        Query Parameters
        urlComponents?.queryItems = [URLQueryItem(name: "vs_currency", value: "usd"),
        URLQueryItem(name: "ids", value: "bitcoin,ethereum,ripple, tether")]
        
        var request = URLRequest(url: (urlComponents?.url)! )
        
        //HTTP Headers
//        request.setValue()
        
        
    }

}

