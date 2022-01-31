//
//  Storage.swift
//  DeliveryAppChallenge
//
//  Created by Guilherme Prata Costa on 25/01/22.
//

import Foundation

public class DefaultsManager<ValueType: Codable>: DefaultsKey {
    
    private let defaults = UserDefaults.standard
    private let key: String
    
    public var keyName: String {
        return self.key
    }
    
    public init(key: String) {
        self.key = key
    }
    
    public var value: ValueType? {
        set {
            self.set(value: newValue)
        }
        get {
            self.get()
        }
    }
        
    private func set(value: ValueType?) {
        guard value != nil else {
            return
        }
        if isCodable(ValueType.self) {
            defaults.set(value, forKey: key)
            return
        }
        do {
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(value)
            defaults.set(encoded, forKey: key)
            defaults.synchronize()
        } catch {
            #if DEBUG
            print("LOG ENCODER -",error)
            #endif
        }
    }
        
    private func get() -> ValueType? {
        if isCodable(ValueType.self) {
            return defaults.value(forKey: key) as? ValueType
        }
        
        guard let data = defaults.data(forKey: key) else { return nil }
        
        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(ValueType.self, from: data)
            return decoded
        } catch {
            #if DEBUG
            print("LOG DECODER -",error)
            #endif
        }
        return nil
    }
    
    public func remove() {
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
        
    private func isCodable<ValueType>(_ type: ValueType.Type) -> Bool {
        switch type {
        case is String.Type, is Bool.Type, is Int.Type, is Float.Type, is Double.Type, is Date.Type:
            return true
        default:
            return false
        }
    }
}
