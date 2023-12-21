//
//  Config.swift
//  Clone-Weather
//
//  Created by 민 on 12/21/23.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let apiKey = "API_KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}
