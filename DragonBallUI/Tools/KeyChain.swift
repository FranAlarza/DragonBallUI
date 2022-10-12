//
//  KeyChain.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 6/10/22.
//

import Foundation


final class keyChainHelper {
    
    static var standard = keyChainHelper()
    
    private init() {}
    
    func save(_ data: Data, service: String) {
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service
        ] as CFDictionary
        
        let status = SecItemAdd(query, nil)
        
        if status == errSecDuplicateItem {
            updateItems(data: data, service: service)
        }
        
        if status != errSecSuccess {
            print("The encode process failed")
        }
    }
    
    func read(service: String) -> Data? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        
        SecItemCopyMatching(query, &result)
        return(result as? Data ?? Data())
    }
    
    func delete(service: String) {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service
        ] as CFDictionary
        
        SecItemDelete(query)
    }
    
    
    private func updateItems(data: Data, service: String) {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service
        ] as CFDictionary
        
        let itemsToUpdate = [kSecValueData: data] as CFDictionary
        SecItemUpdate(query, itemsToUpdate)
    }
}
