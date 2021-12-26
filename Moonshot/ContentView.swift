//
//  ContentView.swift
//  Moonshot
//
//  Created by Dmitry Sharabin on 13.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showingGrid = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    GridLayout(missions: missions, astronauts: astronauts)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    Label {
                        Text(showingGrid ? "List view" : "Grid view")
                    } icon: {
                        Image(systemName: showingGrid ? "rectangle.grid.1x2" : "square.grid.2x2")
                    }
                    .foregroundColor(.white)
                }
                .accessibilityHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
