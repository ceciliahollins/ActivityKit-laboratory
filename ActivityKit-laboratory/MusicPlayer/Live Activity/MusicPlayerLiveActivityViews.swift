//
//  MusicPlayerLiveActivityViews.swift
//  ActivityKit-laboratory
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import SwiftUI
import ActivityKit
import WidgetKit
import AppIntents

extension MusicPlayerLiveActivity {
    
    // MARK: COMPACT
    /// Only supported on devices that have a Dynamic Island.
    /// This is the view for a leading and trailing compacted presentation. They come together on the left and the right side of the front camera to create a cohesive thin Dynamic Island. The view can be tapped to show the expanded view.
    func createCompactLeading(currSong: Song) -> some View {
        Image(currSong.albumCover)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(5)
            .invalidatableContent() /// Use this modifier to inform the system that this data may need to be updated on receiving of new data
    }
    
    func createCompactTrailing() -> some View {
        Image(systemName: "lines.measurement.horizontal")
    }
    
    // MARK: MINIMAL
    /// Only supported on devices that have a Dynamic Island.
    /// The minimal view is used when multiple Live Activites are active, allowing for two activites to be presented at once. One activity will appear attached to the Dynamic Island on the leading or trailing side, and the other will be detached on the opposite side and shown as a circular view. As with a compact activity, this presentation can be tapped to open an expanded view.
    
    func createMinimal(currSong: Song) -> some View {
        Image(currSong.albumCover)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(5)
            .invalidatableContent()
    }
    
    // MARK: EXPANDED
    /// Only supported on devices that have a Dynamic Island.
    /// The expanded view will be presented when a compact or minimal view is presented or when there is a data update from the Live Activity. It will be shown for a breif period to present its information, then go back to a comapct or minimal view to avoid taking up too much screen space. The expanded view is broken up into a leading, trailing, center, and bottom view. Each section is flexible based on the views given and rendering decision is made by the framework. However, a section can be prioritized with the priority modifier. The background color is non negotioable, as it needs to match the color of the front camera to look like a coherent view. This view can have interactable buttons or toggles and provide updates to the data. It could also provide deeplinks into the app if the user wishes to interact further. It is recommeded that the interactivity is kept to a minimal, and is only added for quick, common actions. For more complicated interaction, the user should be deeplinked into the app.
    
    func createExpandedLeading(currSong: Song) -> some View {
        HStack(alignment: .bottom) {
            Image(currSong.albumCover)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(5)
                .invalidatableContent()
            VStack(alignment: .leading) {
                Text(currSong.songTitle)
                    .font(.body)
                    .foregroundColor(Color.white)
                    .invalidatableContent()
                Text(currSong.artist)
                    .font(.caption)
                    .foregroundColor(Color.white)
                    .invalidatableContent()
            }
            .fixedSize(horizontal: true, vertical: false)
        }
    }
    
    func createExpandedTrailing() -> some View {
        Image(systemName: "lines.measurement.horizontal")
            .font(.title)
    }
    
    func createExpandedBottom(currSong: Song) -> some View {
        VStack {
            HStack {
                Text("0:00")
                    .font(.caption)
                Rectangle()
                    .frame(width: .infinity, height: 2)
                Text(currSong.songLength)
                    .font(.caption)
                    .invalidatableContent()
            }
            
            HStack {
                Spacer()
                Button(intent: PreviousSongIntent()) {
                    Image(systemName: "backward.fill")
                        .foregroundColor(.white)
                }
                Spacer()
                Button(intent: PauseSongIntent()) {
                    Image(systemName: "pause.fill")
                        .foregroundColor(.white)
                }
                Spacer()
                Button(intent: NextSongIntent()) {
                    Image(systemName: "forward.fill")
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
    }
    
    // MARK: LOCK SCREEN
    /// Supported on all devices. This view will show on the lock screen for all devices. If a device does not have a Dynamic Island, this view will also be shown on the home screen at the top where the Dynamic Island expanded view would be, presented as a banner.
    /// The lock screen view is similar to the expanded view, but is not split by specific sections and allows for flexibility in the background color. It is similar to the expanded view, in that it can have buttons or toggles for interaction, but interaction should be kept to a minimum and only for quick and common actions.
    
    func createLockScreen(currSong: Song) -> some View {
        VStack {
            HStack(alignment: .bottom) {
                Image(currSong.albumCover)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                    .invalidatableContent()
                VStack(alignment: .leading) {
                    Text(currSong.songTitle)
                        .font(.body)
                        .foregroundColor(Color.white)
                        .invalidatableContent()
                    Text(currSong.artist)
                        .font(.caption)
                        .foregroundColor(Color.white)
                        .invalidatableContent()
                }
                Spacer()
            }

            VStack {
                HStack {
                    Text("0:00")
                        .font(.caption)
                        .foregroundColor(.white)
                    Rectangle()
                        .frame(width: .infinity, height: 2)
                        .foregroundColor(.white)
                    Text(currSong.songLength)
                        .font(.caption)
                        .foregroundColor(.white)
                        .invalidatableContent()
                }
                .padding(.bottom)

                HStack {
                    Spacer()
                    Button { } label: {
                        Image(systemName: "backward.fill")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button { } label: {
                        Image(systemName: "pause.fill")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button { } label: {
                        Image(systemName: "forward.fill")
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
            }
        }
        .padding()
        .background(Color(red: 0.01, green: 0.29, blue: 0.41))
    }
}
