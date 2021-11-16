//
//  GridLayout.swift
//  Moonshot
//
//  Created by Dmitry Sharabin on 16.11.2021.
//

import SwiftUI

struct GridLayout: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        MissionCardView(mission: mission)
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct GridLayout_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        GridLayout(missions: missions, astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
