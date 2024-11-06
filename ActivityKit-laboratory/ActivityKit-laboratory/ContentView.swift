//
//  ContentView.swift
//  ActivityKit-laboratory
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import SwiftUI
import AppIntents

struct ContentView: View {
        
    // Access the defaults group data with the @AppStorage macro
    // Add the store argument to specify access to the app group instead of the regular User Defaults
    @AppStorage(MusicPlayerAppGroup.Keys.currSong.rawValue, store: MusicPlayerAppGroup.defaultsGroup)
    var currSong: Int = 0
    
    @AppStorage(MusicPlayerAppGroup.Keys.isPaused.rawValue, store: MusicPlayerAppGroup.defaultsGroup)
    var isPaused: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                playlistHeader
                songRow
            }
        }
        .padding()
        .background(Color(red: 0.01, green: 0.29, blue: 0.41))
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    currPlayingSong
                    controlButtons
                }
            }
        }
    }
    
    var playlistHeader: some View {
        VStack(alignment: .leading) {
            Image("playlistHeader")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            
            Text("Your Playlist")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(Color.white)
            
            Text("Play a song and see your song on the Dynamic Island")
                .font(.headline)
                .foregroundStyle(.secondary)
                .foregroundStyle(Color.white)
        }
    }
    
    var songRow: some View {
        VStack(spacing: 20) {
            ForEach(SeventiesPlaylist.songs, id: \.songTitle) { song in
                let i = SeventiesPlaylist.songs.firstIndex(of: song) ?? 0
                Button(intent: PlaySelectedSongIntent(song: i)) {
                    HStack {
                        Image(song.albumCover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                        
                        VStack(alignment: .leading) {
                            Text(song.songTitle)
                                .font(.headline)
                                .foregroundStyle(Color.white)
                                .multilineTextAlignment(.leading)
                            Text(song.artist)
                                .font(.body)
                                .foregroundStyle(.secondary)
                                .foregroundStyle(Color.white)
                                .multilineTextAlignment(.leading)
                        }
                        
                        Spacer(minLength: 12)
                        
                        
                        Text(song.songLength)
                            .font(.body)
                            .foregroundStyle(Color.white)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.2))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            }
        }
    }
    
    var currPlayingSong: some View {
        HStack {
            Image(SeventiesPlaylist.songs[currSong].albumCover)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
            
            VStack(alignment: .leading) {
                Text(SeventiesPlaylist.songs[currSong].songTitle)
                    .font(.headline)
                    .foregroundStyle(Color(red: 0.01, green: 0.29, blue: 0.41))
                    .multilineTextAlignment(.leading)
                Text(SeventiesPlaylist.songs[currSong].artist)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .foregroundStyle(Color(red: 0.01, green: 0.29, blue: 0.41))
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
    }
    
    var controlButtons: some View {
        HStack {
            Button(intent: PreviousSongIntent()) {
                Image(systemName: "backward.fill")
                    .foregroundStyle(Color(red: 0.01, green: 0.29, blue: 0.41))
            }
            
            Button(intent: PauseSongIntent()) {
                Image(systemName: isPaused ? "play.fill" : "pause.fill")
                    .foregroundStyle(Color(red: 0.01, green: 0.29, blue: 0.41))
            }
            
            Button(intent: NextSongIntent()) {
                Image(systemName: "forward.fill")
                    .foregroundStyle(Color(red: 0.01, green: 0.29, blue: 0.41))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
