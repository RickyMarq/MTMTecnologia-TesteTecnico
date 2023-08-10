//
//  AgradecimentosScreen.swift
//  MTMTWatch Watch App
//
//  Created by Henrique Marques on 04/08/23.
//

import SwiftUI

struct AgradecimentosScreen: View {
    var body: some View {
        ScrollView {
            Text("Obrigado pela oportunidade")
                .padding(.top, 10)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Image("AgradecimentosImage")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()
            
            Text("Versão 1.0.0")
                .foregroundColor(Color.accentColor)
                .bold()
            
            Spacer()
            Text("Criado por Henrique Marques")
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .navigationTitle("Agradecimentos")
    }
}

struct AgradecimentosScreen_Previews: PreviewProvider {
    static var previews: some View {
        AgradecimentosScreen()
    }
}
