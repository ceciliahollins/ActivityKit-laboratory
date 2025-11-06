//
//  MusicPlayerViewModel.swift
//  ActivityKit-laboratory
//
//  Created by Hollins, Cecilia on 11/9/2025.
//

import Foundation
import ActivityKit

@MainActor
final class MusicPlayerViewModel: ObservableObject {
        
    func startLiveActivity(song: Song) {
        
        if ActivityAuthorizationInfo().areActivitiesEnabled {
            do {
                let musicPlayer = MusicPlayerAttributes(name: "playlist")
                
                let initialState = MusicPlayerAttributes.ContentState(
                    currSong: song,
                    playlistName: "Seventie Playlist"
                )
                let content = ActivityContent(
                    state: initialState,
                    staleDate: .now.addingTimeInterval(3600) // 1 hour expiry
                )
                
                let _ = try Activity.request(
                    attributes: musicPlayer,
                    content: content,
                    pushType: nil)
                
                
            } catch {
                print("Couldn't start activity: \(error)")
            }
        }
    }
}
