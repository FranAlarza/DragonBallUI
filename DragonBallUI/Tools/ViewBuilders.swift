//
//  ViewBuilders.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 12/10/22.
//

import SwiftUI

struct CustomButton <Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(20)
    }
}
