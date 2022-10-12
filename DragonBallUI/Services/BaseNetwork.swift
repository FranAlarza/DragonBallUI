//
//  BaseNetwork.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 10/10/22.
//

import Foundation

let server = "https://dragonball.keepcoding.education"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

enum endpoints: String {
case login = "/api/auth/login"
case heroesList = "/api/heros/all"
}

struct BaseNetwork {
    func getSessionLogin(user: String, password: String) -> URLRequest {
        let urlCad = "\(server)\(endpoints.login.rawValue)"
        let encodeCredentials = "\(user):\(password)".data(using: .utf8)?.base64EncodedString()
        
        var segCredential = ""
        
        if let credential = encodeCredentials {
            segCredential = "Basic \(credential)"
        }
        
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.post
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-Type")
        request.addValue(segCredential, forHTTPHeaderField: "Authorization")
        return request
    }
    
    func getSessionHeroes(filter: String) -> URLRequest {
        let urlCad = "\(server)\(endpoints.heroesList.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.post
        request.httpBody = try? JSONEncoder().encode(HeroesFilter(name: filter))
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-Type")
        
        guard let tokenKC = keyChainHelper.standard.read(service: CONST_TOKEN_ID) else { return URLRequest(url: URL(string: "")!) }
        let token = String(data: tokenKC, encoding: .utf8)
        if let tokenJWT = token {
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: "Authorization")
        }
        return request
    }
    
    
}



