//
//  SpaceshipScreen.swift
//  State Spaceship (aka Stateship)
//
//  Created by Jane Madsen on 9/29/25.
//

import SwiftUI

@Observable class ShipComputerViewModel {
    var availablePower = 10
    var heading = ""
}

struct SpaceshipScreen: View {
    @State var shipComputerViewModel = ShipComputerViewModel()
    
    var body: some View {
        Form {
            Section("Helm Station") {
                HelmStation()
            }
            
            Section("Weapons Station") {
                WeaponsStation()
            }
            
            Section("Shield Station") {
                ShieldStation()
            }
            
            Section("Engine Station") {
                EngineStation()
            }
            
            Text("Available Power: \(shipComputerViewModel.availablePower)")

        }
        .padding()
        .environment(shipComputerViewModel)
    }
}

struct HelmStation: View {
    @Environment(ShipComputerViewModel.self) var shipComputerViewModel // what does this do?
    @State var powerUsed: Int = 0
    @State var inChair: Bool = false
    
    var body: some View {
        @Bindable var shipComputerViewModel = shipComputerViewModel
        
        HStack {
            CrewChair(crewMember: .dog, inChair: $inChair)
            
            TextField("Heading", text: $shipComputerViewModel.heading).disabled(!inChair)
        }
    }
}

struct WeaponsStation: View {
    @Environment(ShipComputerViewModel.self) var shipComputerViewModel
    @State var powerUsed: Int = 0
    @State var isOn: Bool = false
    @State var inChair: Bool = false
    
    var body: some View {
        @Bindable var shipComputerViewModel = shipComputerViewModel
        
        HStack {
            CrewChair(crewMember: .cat, inChair: $inChair)
            
            VStack {
                Toggle("Weapons Power: \(powerUsed)", isOn: $isOn)
                        .onChange(of: isOn) {
                            // Add logic to remove/add 3 power to the system when enabled/disabled
                            if isOn {
                                shipComputerViewModel.availablePower -= 3
                                powerUsed = 3
                            } else {
                                shipComputerViewModel.availablePower += 3
                                powerUsed = 0
                            }
                                
                            if shipComputerViewModel.availablePower < 0 {
                                isOn = false
                            }
                        }.disabled(!inChair)
                
                Button("Fire!") {
                    // Add logic to only allow firing if power is available
                    print("PEW!")
                }
                .disabled(!isOn)
            }
        }
    }
}

struct ShieldStation: View {
    @Environment(ShipComputerViewModel.self) var shipComputerViewModel
    @State var powerUsed: Int = 0
    @State var inChair: Bool = false
    
    var body: some View {
        @Bindable var shipComputerViewModel = shipComputerViewModel
        
        HStack {
            CrewChair(crewMember: .lizard, inChair: $inChair)
            
            Stepper("Shield Power: \(powerUsed)", value: $powerUsed, in: 0...10)
                .onChange(of: powerUsed) { oldValue, newValue in
                    let difference = newValue - oldValue
                    
                    shipComputerViewModel.availablePower -= difference
                    
                    //not working correctly, can go negative past 0
                    if shipComputerViewModel.availablePower < 0 {
                        powerUsed = oldValue
                    }
                }.disabled(!inChair)
        }
    }
}

struct EngineStation: View {
    @Environment(ShipComputerViewModel.self) var shipComputerViewModel
    @State var powerUsed: Int = 0
    @State var inChair: Bool = false
    
    var body: some View {
        @Bindable var shipComputerViewModel = shipComputerViewModel
        
        HStack {
            CrewChair(crewMember: .hare, inChair: $inChair)
            Stepper("Engine Power: \(powerUsed)", value: $powerUsed, in: 0...10)
                .onChange(of: powerUsed) { oldValue, newValue in
                    let difference = newValue - oldValue
                    
                    shipComputerViewModel.availablePower -= difference
                    
                    //not working correctly, can go negative past 0
                    if shipComputerViewModel.availablePower < 0 {
                        powerUsed = oldValue
                    }
                }.disabled(!inChair)
        }
    }
}

struct CrewChair: View {
    var crewMember: Crew
    @Binding var inChair: Bool
    
    var body: some View {
        Button {
            inChair.toggle()
        } label: {
            if inChair {
                crewMember.icon
            } else {
                Image(systemName: "person.slash")
            }
        }
        .padding(5)
        .buttonStyle(.plain)
        .background {
            Circle()
                .foregroundStyle(.gray)
        }
    }
}

enum Crew: String {
    case dog
    case cat
    case lizard
    case hare
    
    var icon: Image {
        switch self {
        case .dog:
            Image(systemName: "dog")
        case .cat:
            Image(systemName: "cat")
        case .lizard:
            Image(systemName: "lizard")
        case .hare:
            Image(systemName: "hare")
        }
    }
}

#Preview {
    SpaceshipScreen()
}
