//
//  MissionCardView.swift
//  Moonshot
//
//  Created by Dmitry Sharabin on 16.11.2021.
//

import SwiftUI

struct MissionCardView: View {
    let mission: Mission
    
    var body: some View {
        VStack {
            Image(decorative: mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
                    .accessibilityHidden(true)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.lightBackground)
        )
    }
}

struct MissionCardView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionCardView(mission: missions[0])
            .previewLayout(.sizeThatFits)
            .frame(minWidth: 150)
            .preferredColorScheme(.dark)
    }
}
