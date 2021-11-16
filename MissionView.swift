//
//  MissionView.swift
//  Moonshot
//
//  Created by Dmitry Sharabin on 15.11.2021.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var launchDate: String {
        mission.launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A"
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    Text(launchDate)
                        .padding(.top)
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.5))
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                    }
                    .padding(.horizontal)
                    
                    CrewView(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name).")
            }
        }
    }
    
    struct CrewView: View {
        let crew: [CrewMember]
        
        var body: some View {
            VStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.lightBackground)
                    .padding(.vertical)
                
                Text("Crew")
                    .font(.title.bold())
                    .padding(.bottom, 5)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink {
                            AstronautView(astronaut: crewMember.astronaut)
                        } label: {
                            CrewMemberView(crewMember: crewMember)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
    
    struct CrewMemberView: View {
        let crewMember: CrewMember
        
        var body: some View {
            HStack {
                ZStack {
                    Image(crewMember.astronaut.id)
                        .resizable()
                        .frame(width: 104, height: 72)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(isCaptain(crewMember) ? .orange : .white, lineWidth: 1.5)
                        )
                    
                    if isCaptain(crewMember) {
                        Text("🚀")
                            .font(.title2)
                            .offset(x: 46, y: -30)
                    }
                }
                .padding(.top, 10)
                
                VStack(alignment: .leading) {
                    Text(crewMember.astronaut.name)
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Text(crewMember.role)
                        .foregroundColor(.secondary)
                }
            }
        }
        
        func isCaptain(_ crewMember: CrewMember) -> Bool {
            ["Commander", "Command Pilot"].contains(crewMember.role)
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
