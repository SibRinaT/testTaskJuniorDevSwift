//
//  Utils.swift
//  testTaskJuniorDevSwift
//
//  Created by Artem on 02.02.2024.
//

import Foundation

struct Utils {
    enum Keys: String {
        case user = "SavedUser"
        case onboarding = "isOnboardingCompleted"
    }
    
    static let defaults = UserDefaults.standard
    
    static func save(model: Codable, key: Utils.Keys) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(model) {
            Utils.defaults.set(encoded, forKey: key.rawValue)
        }
    }
    
    static func getModelFor<T>(key: Utils.Keys) -> T? where T: Codable {
        if let savedModel = Utils.defaults.object(forKey: key.rawValue) as? Data {
            let decoder = JSONDecoder()
            return try? decoder.decode(T.self, from: savedModel)
        } else {
            return nil
        }
    }
    
    static func getBoolFor(key: Utils.Keys) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    static func saveTrueFor(key: Utils.Keys) {
        UserDefaults.standard.setValue(true, forKey: key.rawValue)
    }
}
