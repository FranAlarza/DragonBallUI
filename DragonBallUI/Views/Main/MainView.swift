//
//  MainView.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 10/10/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            VStack {
                HeroesView(viewModel: ViewModelHeroes())
            }.tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
