//
//  HeroesRowView.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 10/10/22.
//

import SwiftUI

struct HeroesRowView: View {
    var hero: Heroes
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: hero.photo)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .padding([.leading, .trailing], 20)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .padding([.leading, .trailing], 20)
            }

            
            Text("\(hero.name)")
                .font(.title)
            
            if hero.favorite! {
                Image(systemName: "heart.circle")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .foregroundColor(.red)
            } else {
                Image(systemName: "heart.circle")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct HeroesRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesRowView(hero: Heroes(id: UUID(), name: "Goku", description: "Sobran las presentaciones cuando se habla de Goku. El Saiyan fue enviado al planeta Tierra, pero hay dos versiones sobre el origen del personaje. Según una publicación especial, cuando Goku nació midieron su poder y apenas llegaba a dos unidades, siendo el Saiyan más débil. Aun así se pensaba que le bastaría para conquistar el planeta. Sin embargo, la versión más popular es que Freezer era una amenaza para su planeta natal y antes de que fuera destruido, se envió a Goku en una incubadora para salvarle.", photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300", favorite: true))
    }
}
