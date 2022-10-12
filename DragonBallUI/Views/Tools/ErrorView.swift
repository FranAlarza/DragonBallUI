//
//  ErrorView.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 10/10/22.
//

import SwiftUI

struct ErrorView: View {
    private var textError: String
    
    init(textError: String) {
        self.textError = textError
    }
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "exclamationmark.bubble")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 200, height: 200)
                .padding()
            Text(textError)
                .foregroundColor(.red)
                .font(.headline)
            Spacer()
            Button {
                //
            } label: {
                Text("Volver al login")
            }
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.orange)
            .cornerRadius(15)
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(textError: "Error")
    }
}
