//
//  HeroesView.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 10/10/22.
//

import SwiftUI

struct HeroesView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @StateObject var viewModel: ViewModelHeroes
    @State private var filter = ""
    
    var body: some View {
        NavigationStack {
            List {
                if let heroes = viewModel.heroes {
                    ForEach(heroes) { hero in
                        NavigationLink {
                            HeroDetailView(hero: hero, viewModelHeroes: viewModel)
                        } label: {
                            HeroesRowView(hero: hero)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        rootViewModel.closeSession()
                    } label: {
                        HStack {
                            Image(systemName: "xmark.circle")
                            Text("Close Session")
                        }
                        .foregroundColor(.orange)
                    }
                }
            }
            .searchable(text: $filter, prompt: "Buscar Heroe")
            .onChange(of: filter) { newValue in
                viewModel.getHeroes(filter: newValue)
            }
        }
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView(viewModel: ViewModelHeroes(testing: true))
    }
}
