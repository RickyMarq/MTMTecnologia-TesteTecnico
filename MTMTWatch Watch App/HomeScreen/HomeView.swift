//
//  ContentView.swift
//  MTMTWatch Watch App
//
//  Created by Henrique Marques on 04/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var data: [HomeModelList] = [HomeModelList(name: "Personagens", icon: "person", view: AnyView(CharacterScreen())), HomeModelList(name: "Agradecimentos", icon: "info", view: AnyView(AgradecimentosScreen()))]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data, id: \.id) { datum in
                    NavigationLink(destination: datum.view) {
                        HStack {
                            Image(systemName: datum.icon ?? "")
                                .foregroundColor(Color.accentColor)
                            Text(datum.name ?? "")
                                .bold()
                        }
                    }
                }
                .navigationTitle("MTM Teste")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
