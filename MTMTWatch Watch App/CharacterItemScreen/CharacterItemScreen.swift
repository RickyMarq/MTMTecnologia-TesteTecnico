//
//  CharacterItemScreen.swift
//  MTMTWatch Watch App
//
//  Created by Henrique Marques on 04/08/23.
//

import SwiftUI
import WatchKit
import SDWebImageSwiftUI

struct CharacterItemScreen: View {
    var data: ResultData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("#" + String(data.id ?? 0))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.secondary)
                
                Text(data.name ?? "")
                    .fontWeight(.black)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(.title, design: .rounded))
                
                ZStack(alignment: .topTrailing) {
                    WebImage(url: URL(string: data.image ?? ""))
                        .resizable()
                        .placeholder(content: {
                            Rectangle().foregroundColor(Color.gray)
                        })
                        .transition(.fade(duration: 0.5))
                        .cornerRadius(10)
                        .scaledToFill()
                        .shadow(color: Color.accentColor, radius: 0.5, x: 0, y: 0.5)
                    
                    Text(data.status ?? "")
                        .bold()
                        .padding(5)
                        .background(Color.black)
                        .cornerRadius(10)
                        .offset(x: -10, y: 10)
                }
                
                HStack(alignment: .center) {
                    Text("Origin")
                    Spacer()
                    
                    
                    Text(data.origin.name ?? "")
                        .bold()
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(Color.init(hex: "18191c"))
                .cornerRadius(10)
                
                HStack(alignment: .center) {
                    Text("Location")
                    Spacer()
                    
                    Text(data.location.name ?? "")
                        .bold()
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(Color.init(hex: "18191c"))
                .cornerRadius(10)
            }
        }
    }
}

