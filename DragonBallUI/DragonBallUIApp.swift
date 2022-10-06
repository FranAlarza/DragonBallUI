//
//  DragonBallUIApp.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 6/10/22.
//

import SwiftUI

@main
struct DragonBallUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
