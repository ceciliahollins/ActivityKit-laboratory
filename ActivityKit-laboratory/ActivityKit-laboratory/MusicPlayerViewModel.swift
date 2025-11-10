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
    
    @Published var activityViewState: MusicPlayerAttributes.ContentState? = nil
    private var currentActivity: Activity<MusicPlayerAttributes>? = nil
        
    // This function starts the live activity. This is normally run on some user action, such as they select a song to start playing/
    func startLiveActivity(song: Song) {
        
        if ActivityAuthorizationInfo().areActivitiesEnabled {
            do {
                let musicPlayer = MusicPlayerAttributes(name: "playlist")
                
                // Set the initial state of the dynamic data
                let initialState = MusicPlayerAttributes.ContentState(
                    currSong: song,
                    secondsLeftInSong: 0,
                )
                
                // Create the activity content with the initial state
                // If staleDate is nil, the live activity will continue until the OS stops it
                // It is suggested to end the activity after an appropriate period of time or on some user action
                let content = ActivityContent(
                    state: initialState,
                    staleDate: .now.addingTimeInterval(3600) // 1 hour expiry
                )
                
                // Request for the activity with the attributes and the created content
                currentActivity = try Activity.request(
                    attributes: musicPlayer,
                    content: content,
                    pushType: nil)
                
                activityViewState = initialState
                
                
            } catch {
                print("Couldn't start activity: \(error)")
            }
        }
    }
    
    // This method shows an example of an alerted updated to the live activity
    // In this example, the live activity will be updated when the song changes
    func updateLiveActivity(song: Song) async {
        
        // ensure the activity has been started
        guard let activity = currentActivity else {
            return
        }
        
        // Create the alert configuration
        // The behavior will be different if the user does or does not have dynamic island, and whether the user is on the lock screen or the home page
        let alertConfig = AlertConfiguration(
            title: "\(song.songTitle) has begun playing!",
            body: "Open the app and see the new song \(song.songTitle).",
            sound: .default
        )
        // Create the new content state with the updated data
        let contentState = MusicPlayerAttributes.ContentState(currSong: song,
                                                              secondsLeftInSong: 0)
        
        // Update the live activity with the content state and the alert configuration
        await activity.update(ActivityContent(state: contentState, staleDate: Date.now + 15),
                              alertConfiguration: alertConfig)
    }
}
