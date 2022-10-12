//
//  wrappers.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 10/10/22.
//

import Foundation

@propertyWrapper
class kCPersistenceKeychain {
    private var service: String
    
    init(service: String) {
        self.service = service
    }
    
    var wrappedValue: String {
        set {
            guard let dataValue = newValue.data(using: .utf8) else { return }
            keyChainHelper.standard.save(dataValue, service: service)
        }
        get {
            guard let token = keyChainHelper.standard.read(service: service) else { return "" }
            if let value = String(data: token, encoding: .utf8) {
                return value
            } else {
                return ""
            }
        }
    }
}
