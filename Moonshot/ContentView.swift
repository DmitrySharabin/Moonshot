//
//  ContentView.swift
//  Moonshot
//
//  Created by Dmitry Sharabin on 13.11.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
//            Text("Hello, world!")
//                .padding()
//                .navigationTitle("SwiftUI")
            
//            NavigationLink {
//                Text("Detail View")
//            } label: {
//                Text("Hello, world!")
//                    .padding()
//            }
//            .navigationTitle("SwiftUI")
            
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
                .navigationTitle("SwiftUI")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
