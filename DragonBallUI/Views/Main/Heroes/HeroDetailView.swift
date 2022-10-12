//
//  HeroDetailView.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 12/10/22.
//

import SwiftUI

struct HeroDetailView: View {
    var hero: Heroes
    @ObservedObject var viewModelHeroes: ViewModelHeroes
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                AsyncImage(url: URL(string: hero.photo)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .padding([.leading, .trailing], 5)
                } placeholder: {
                    ProgressView()
                }
                HStack {
                    Text("\(hero.name)")
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                        .padding([.trailing, .leading], 20)
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        Image(systemName: "heart.circle")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .padding([.trailing, .leading], 20)
                            .foregroundColor(hero.favorite! ? Color.red : Color.gray)
                    }
                }
                
                Text("\(hero.description)")
                    .padding()
                    .foregroundColor(.black)
                    .bold()
            }
            
        }
    }
}


struct HeroDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeroDetailView(hero: Heroes(id: UUID(), name: "Goku", description: "Sobran las presentaciones cuando se habla de Goku. El Saiyan fue enviado al planeta Tierra, pero hay dos versiones sobre el origen del personaje. Según una publicación especial, cuando Goku nació midieron su poder y apenas llegaba a dos unidades, siendo el Saiyan más débil. Aun así se pensaba que le bastaría para conquistar el planeta. Sin embargo, la versión más popular es que Freezer era una amenaza para su planeta natal y antes de que fuera destruido, se envió a Goku en una incubadora para salvarle.", photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300", favorite: true), viewModelHeroes: ViewModelHeroes(testing: true))
    }
}
