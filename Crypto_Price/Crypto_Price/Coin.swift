//
//  Coin.swift
//  Crypto_Price
//
//  Created by Thiri Htet on 25/07/2025.
//

struct Coin: Codable{
    var symbol: String
    var name : String
    var price : Double
    var percentChange : Double
    
    enum CodingKeys: String, CodingKey {
        case symbol
        case name
        case price = "current_price"
        case percentChange = "price_change_percentage_24h"
    }
}
