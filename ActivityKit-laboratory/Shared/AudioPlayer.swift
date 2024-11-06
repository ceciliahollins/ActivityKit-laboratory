//
//  AudioPlayer.swift
//  ActivityKit-laboratory
//
//  Created by Hollins, Cecilia on 22/10/2024.
//


import Foundation
import SwiftUI
import AVFoundation

@Observable
class AudioPlayer: NSObject, AVAudioPlayerDelegate {
    
    private var audioPlayer: AVAudioPlayer!
    
    var isPlaying: Bool {
        audioPlayer.isPlaying
    }
    var songHasFinished: () -> ()
    
    init(songHasFinished: @escaping () -> Void) {
        self.songHasFinished = songHasFinished
        super.init()
        loadSong(SeventiesPlaylist.songs[0].audioFileName)
    }
    
    func loadSong(_ fileName: String) {
        let path = Bundle.main.path(forResource: "\(fileName).mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.delegate = self
        } catch {
            print("couldn't load the file")
        }
    }
    
    func play() {
        audioPlayer.play()
    }
    
    func pause() {
        audioPlayer.pause()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        songHasFinished()
    }
}
