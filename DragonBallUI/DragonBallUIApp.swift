//
//  DragonBallUIApp.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 6/10/22.
//

import SwiftUI

@main
struct DragonBallUIApp: App {
    //let persistenceController = PersistenceController.shared
    @StateObject var rootViewModel = RootViewModel()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootViewModel)
        }
    }
}
