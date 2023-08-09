//
//  Cards.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 04/08/23.
//

import SwiftUI

struct BaseCard<Content: View>: View {
    var height: CGFloat = 100
    let cardContent: () -> Content
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.secondary.opacity(0.15))
                .frame(height: height)
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.30), radius: 8)
            
            cardContent()
        }
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
