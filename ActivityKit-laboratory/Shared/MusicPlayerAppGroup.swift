//
//  MusicPlayerAppGroup.swift
//  ActivityKit-laboratory
//
//  Created by Hollins, Cecilia on 5/11/2024.
//

import Foundation

/// App Groups is how the main app and the Live Activities communicate with each other. To create an app group, first add a new capability to the project by going into the app targets signing and capabilities tab. Then ensure both the main app and any extensions that need data updates also have the app group capability added to their targets as well. Created app groups can be viewed in the developer portal under the identifiers tab.
/// App groups are used through posting to the user defaults and using the .init(suiteName:) method.
/// See more information here https://developer.apple.com/documentation/xcode/configuring-app-groups
struct MusicPlayerAppGroup {
    
    static var audioPlayer = AudioPlayer(songHasFinished: nextSong)
    
    // Add the name of the created App Group. This value should be the same value as what was created in 'Signing and Capabilities' tab.
    private static let appGroup = ""
    
    // Create the defaults group
    static let defaultsGroup = UserDefaults(suiteName: appGroup)
    
    // Create the keys for the shared data
    enum Keys: String {
        case currSong
        case isPaused
    }
    
    // Post updates to the user defaults, using the App Group name
    // Update the audio accordingly

    static func nextSong() {
        var val = getCurrentSong()
        val = val == SeventiesPlaylist.songs.count - 1 ? 0 : val + 1
        playSong(val)
    }
    
    static func previousSong() {
        var val = getCurrentSong()
        val = val == 0 ? SeventiesPlaylist.songs.count - 1 : val - 1
        playSong(val)
    }
    
    static func playSong(_ song: Int) {
        defaultsGroup?.setValue(song, forKey: Keys.currSong.rawValue)
        audioPlayer.loadSong(SeventiesPlaylist.songs[song].audioFileName)
        pauseSong()
        audioPlayer.play()
    }
    
    static func pauseSong() {
        var val = songIsPaused()
        val.toggle()
        
        val ? audioPlayer.pause() : audioPlayer.play()
        defaultsGroup?.setValue(val, forKey: Keys.isPaused.rawValue)
    }
    
    static func songIsPaused() -> Bool {
        return !audioPlayer.isPlaying
    }
    
    static func getCurrentSong() -> Int {
        guard let currSong = defaultsGroup?.value(forKey: Keys.currSong.rawValue) as? Int else {
            return 0
        }
        
        return currSong
    }
}
