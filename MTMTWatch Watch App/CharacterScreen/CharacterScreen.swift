//
//  CharacterScreen.swift
//  MTMTWatch Watch App
//
//  Created by Henrique Marques on 04/08/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterScreen: View {
    
    @State var objc: [HomeModel] = []
    @State var results: [ResultData] = []
    @State var nextPage: String? = "https://rickandmortyapi.com/api/character"
    
    var body: some View {
        List {
            ForEach(results) { datum in
                NavigationLink(destination: CharacterItemScreen(data: datum)) {
                    VStack(alignment: .leading) {
                        Text(datum.name ?? "")
                            .bold()
                        
                        Spacer()
                        Text(datum.species ?? "")
                            .foregroundColor(Color.secondary)
                    }
                }
            }
            
            VStack(alignment: .center) {
                ProgressView()
                    .progressViewStyle(.circular)
                
            }
            .onAppear {
                getMoreData(nextPage: nextPage ?? "")
            }
        }
        .navigationTitle("Personagens")
    }
    
    func getMoreData(nextPage: String) {
        WebServiceWatch.sharedObjc.getMoreCharacters(nextPage: nextPage) { result in
            switch result {
            case .success(let model):
                self.nextPage = model.info.next
                self.results.append(contentsOf: model.results)
            case .failure(_):
                print("Error.")
            }
        }
    }
}

struct CharacterScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharacterScreen()
    }
}
