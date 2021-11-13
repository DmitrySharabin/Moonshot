//
//  ContentView.swift
//  Moonshot
//
//  Created by Dmitry Sharabin on 13.11.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Image("Example")
//            .resizable()
////            .scaledToFit()
//            .scaledToFill()
//            .frame(width: 300, height: 300)
////            .clipped()
//    }
        GeometryReader { geo in
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
