//
//  ActivityKit-laboratoryApp.swift
//  ActivityKit-laboratory
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import SwiftUI
import AVFAudio
import ActivityKit

@main
struct ActivityKitLaboratoryApp: App {
    
    init() {
        cleanupOldActivities()
        setupAudioSession()
    }
        
    var body: some Scene {
        WindowGroup {
            MusicPlayerView()
        }
    }
    
    // This function cleans up any activity that may have been lingering in the background
    // On first launch, clear any old activities
    func cleanupOldActivities() {
        Task {
            for activity in Activity<MusicPlayerAttributes>.activities {
                await activity.end(nil, dismissalPolicy: .immediate)
            }
        }
    }
    
    // This is a helper function to ensure audio will play while the app is in the background
    func setupAudioSession() {
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.playback, mode: .default)
            try session.setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
    }
}
