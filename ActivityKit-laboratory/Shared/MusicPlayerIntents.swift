//
//  MusicPlayerIntents.swift
//  ActivityKit-laboratory
//
//  Created by Hollins, Cecilia on 5/11/2024.
//

import AppIntents

/// AppIntents allow for interactivity with widgets and Live Activities. The AppIntent protocol required a title that is human readable, and a perform function that performs and action based on the intent. For now, only an empty result is returned to inform the AppIntent is finished. As soon as the perform method is returned, the system will reload the widget timeline or update the Live Activity.

struct PauseSongIntent: AppIntent {
    
    /// The title is used for the Shortcuts app and shortcut editor
    /// A description variable of type LocalizedStringResource can also be added for further context
    static var title: LocalizedStringResource = "Play/Pause song"
    
    /// The protocol the system runs to perform the intent
    /// Returns a result, which may include subsequent actions, dialogue to display or annouce, or a SwiftUI view. If there is nothing to return, an empty result can be returned to tell the system the intent is finished.
    func perform() async throws -> some IntentResult {
        MusicPlayerAppGroup.pauseSong()
        return .result()
    }
}

struct NextSongIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Next song"
    
    func perform() async throws -> some IntentResult {
        MusicPlayerAppGroup.nextSong()
        return .result()
    }
}

struct PreviousSongIntent: AppIntent {
    static var title: LocalizedStringResource = "Previous song"
    
    func perform() async throws -> some IntentResult {
        MusicPlayerAppGroup.previousSong()
        return .result()
    }
}

struct PlaySelectedSongIntent: AppIntent {
    static var title: LocalizedStringResource = "Play selected song"
    
    @Parameter(title: "song") var song: Int?
    
    init(song: Int?) {
        self.song = song
    }
    
    init() {}
    
    func perform() async throws -> some IntentResult {
        MusicPlayerAppGroup.playSong(song ?? 0)
        return .result()
    }
}
