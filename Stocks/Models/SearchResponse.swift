//
//  SearchResponse.swift
//  Stocks
//
//  Created by Erdicem on 19.05.2022.
//

import Foundation


struct SearchResponse: Codable {
    let count: Int
    let result: [SearchResult]
}

struct SearchResult: Codable {
    let description: String
    let displaySymbol: String
    let symbol: String
    let type: String
}


