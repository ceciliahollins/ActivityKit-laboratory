//
//  MusicPlayerAttributes.swift
//  ActivityKit-laboratory
//
//  Created by Hollins, Cecilia on 11/9/2025.
//

import ActivityKit

struct MusicPlayerAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here
        // The live activity will update when one of these values update
        var currSong: Song
        var secondsLeftInSong: Int
    }

    // Fixed non-changing properties about your activity go here!
    // I currently have none, so I will put a dummy value here
    var name: String
}
