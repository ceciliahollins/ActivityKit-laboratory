//
//  SeventiesPlaylist.swift
//  ActivityKit-laboratory
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import SwiftUI

struct SeventiesPlaylist {
    static var songs: [Song] = SeventiesPlaylist.createSeventiesPlaylist()
    
    static func createSeventiesPlaylist() -> [Song] {
        let one = Song(songTitle: "Dreams", artist: "Fleetwood Mac", albumCover: "fleetwoodMac", songLength: "4:18", audioFileName: "FleetwoodMac_Dreams")
        let two = Song(songTitle: "One of These Nights", artist: "Eagles", albumCover: "eagles", songLength: "4:52", audioFileName: "Eagles_OneOfTheseNights")
        let three = Song(songTitle: "Bennie and The Jets", artist: "Elton John", albumCover: "eltonJohn", songLength: "5:23", audioFileName: "EltonJohn_BennieAndTheJets")
        let four = Song(songTitle: "Dancing in the Moonlight", artist: "Toploader", albumCover: "toploader", songLength: "3:52", audioFileName: "Toploader_DancingInTheMoonlight")
        let five = Song(songTitle: "Vienna", artist: "Billy Joel", albumCover: "billyJoel", songLength: "3:34", audioFileName: "BillyJoel_Vienna")
        
        return [one, two, three, four, five]
    }
    
}
