//
//  Cards.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 04/08/23.
//

import SwiftUI

struct BaseCard<Content: View>: View {
    let cardContent: () -> Content
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.secondary.opacity(0.15))
                .frame(height: 100)
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.30), radius: 8)
            
            cardContent()
        }
    }
}

struct Cards: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BaseCard_Previews: PreviewProvider {
    static var previews: some View {
        BaseCard {
            Text("Hello, world!")
                .bold()
                .padding()
        }
    }
}
