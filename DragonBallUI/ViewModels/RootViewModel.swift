//
//  RootViewModel.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 10/10/22.
//

import Foundation
import Combine

public let CONST_TOKEN_ID = "token"

final class RootViewModel: ObservableObject {
    @Published var status = Status.none
    private var suscriptors = Set<AnyCancellable>()
    @kCPersistenceKeychain(service: CONST_TOKEN_ID) var tokenJWT
    
    init() {
        self.logedUserControl()
    }
    
    func logedUserControl() {
        if tokenJWT != "" {
            self.status = .loaded
        }
    }
    
    func closeSession() {
        keyChainHelper.standard.delete(service: CONST_TOKEN_ID)
        status = .none
    }
    
    func login(user: String, password: String) {
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionLogin(user: user, password: password))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return String(decoding: $0.data, as: UTF8.self)
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure:
                    self.status = Status.error
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { token in
                self.tokenJWT = token
            }
            .store(in: &suscriptors)

    }
}
