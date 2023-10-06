//
//  LabelTextFormatter.swift
//  LabelTextFormatter
//
//  Created by IDAP Developer on 06.10.2023.
//  Copyright © 2019 IDAP. All rights reserved.
//

import Foundation

@propertyWrapper
public class UserDefaultWrapper<Value> {
    
    // MARK: -
    // MARK: Variables
    
    public var wrappedValue: Value {
        get {
            self.defaults.synchronize()
            return self.get(self.defaults)
        }
        
        set {
            self.set((newValue, self.defaults))
            self.defaults.synchronize()
        }
    }
    
    private let key: String
    private let defaultValue: Value
    private let defaults: UserDefaults
    
    private lazy var set: ((Value, UserDefaults)) -> () = {
        let value = $0.0 as Any
        
        if case Optional<Any>.none = value {
            $0.1.removeObject(forKey: self.key)
        } else {
            $0.1.set($0.0, forKey: self.key)
        }
    }
    
    private lazy var get: (UserDefaults) -> (Value) = {
        self.cast($0.object(forKey: self.key)) ?? self.defaultValue
    }
    
    private func cast<Value, Result>(_ value: Value) -> Result? {
        return value as? Result
    }
    
    // MARK: -
    // MARK: Initializations

    init(
        key: String,
        defaultValue: Value,
        defaults: UserDefaults = .standard,
        set: (((Value, UserDefaults)) -> ())? = nil,
        get: ((UserDefaults) -> (Value))? = nil
    ) {
        self.key = key
        self.defaultValue = defaultValue
        self.defaults = defaults
        
        set.map { self.set = $0 }
        get.map { self.get = $0 }
    }
}
