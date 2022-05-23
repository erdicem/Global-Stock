//
//  NewsStory.swift
//  Stocks
//
//  Created by Erdicem on 20.05.2022.
//

import Foundation

struct NewsStory: Codable {
    let category: String
    let datetime: TimeInterval
    let headline: String
    let image: String
    let related: String
    let source: String
    let summary: String
    let url: String
}
