//
//  PersistenceManagers.swift
//  Stocks
//
//  Created by Erdicem on 7.05.2022.
//

import Foundation

// ["APPL", "MSFT"]
// [AAPL: Apple Inc.]
final class PersistenceManager {
    static let shared = PersistenceManager()
    
    private let userDefaults: UserDefaults = .standard
    
    private struct Constants {
        static let onboardedKey = "hasOnboarded"
        static let watchlistKey = "watchlist"
    }
    
    private init(){}
    
    
    // MARK: - Public
    public var watchList : [String] {
        if !hasOnBoarded {
            userDefaults.setValue(true, forKey: Constants.onboardedKey)
            setUpDefaults()
        }
        return userDefaults.stringArray(forKey: Constants.watchlistKey) ?? []
    }
    
    public func watchlistContains(symbol:String) -> Bool {
        return watchList.contains(symbol)
    }
    
    
    public func addToWatchList(symbol:String, companyName: String) {
        var current = watchList
        current.append(symbol)
        userDefaults.set(current, forKey: Constants.watchlistKey)
        userDefaults.set(companyName,forKey: symbol)
        
        NotificationCenter.default.post(name: .didAddToWatch, object: nil)
    }
    
    public func removeFromWatchList(symbol:String) {
        var newList = [String]()
        
        userDefaults.set(nil, forKey: symbol)
        for item in watchList where item != symbol {
            newList.append(item)
        }
        
        userDefaults.set(newList, forKey: Constants.watchlistKey)
        
    }
    
    
    // MARK: - Private
    
    private var hasOnBoarded: Bool {
        return userDefaults.bool(forKey: Constants.onboardedKey)
    }
    
    private func setUpDefaults() {
        let map: [String: String] = [
            "AAPL": "Apple Inc.",
            "MSFT": "Microsoft Corporation",
            "SNAP": "Snap Inc.",
            "GOOG": "Alphabet",
            "AMZN": "Amazon.com, Inc.",
            "WORK": "Slack Technologies",
            "FB": "Facebook Inc.",
            "NVDA": "Nvidia Inc.",
            "NKE" : "Nike",
            "PINS": "Pinterest"
        ]
        
        let symbols = map.keys.map {$0}
        userDefaults.set(symbols, forKey: Constants.watchlistKey)
        
        for (symbol, name) in map {
            userDefaults.set(name, forKey: symbol)
        }
    }
}

