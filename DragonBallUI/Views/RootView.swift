//
//  RootView.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 10/10/22.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var body: some View {
        switch (rootViewModel.status) {
        case Status.none:
            LoginView()
        case Status.register:
            Text("Vista Registro")
        case Status.loading:
            LoaderView()
        case Status.error:
            ErrorView(textError: "Error")
        case Status.loaded:
            MainView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel())
    }
}
