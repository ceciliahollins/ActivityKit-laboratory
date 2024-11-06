//
//  MusicPlayer.swift
//  MusicPlayer
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import WidgetKit
import SwiftUI
import Intents

/// This is an example of a widget that could be developed alongside a Live Activity feature.
/// A widget is not necessarily needed in this feature of a music player, but it is good to have an example of both working alongside each other to present data
/// This widget will show a song in your playlist, presenting a new song every hour
/// Run the preview to view the timeline of widgets
struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), song: SeventiesPlaylist.songs[0])
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, song: SeventiesPlaylist.songs[0])
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Create a timeline of 5 songs to be shown every hour
        // This would not be a realistic widget to create since it is just showing random songs in the playlist and cannot take live data in, but this widget is just a filler example anyways.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, song: SeventiesPlaylist.songs[hourOffset])
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let song: Song
}

struct MusicPlayerEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Image(entry.song.albumCover)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            
            Text(entry.song.songTitle)
                .font(.headline)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .contentTransition(.symbolEffect)
            
            Text(entry.song.artist)
                .font(.body)
                .foregroundStyle(.secondary)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .contentTransition(.symbolEffect)
        }
        .containerBackground(for: .widget) {
            Color(red: 0.01, green: 0.29, blue: 0.41)
        }
    }
}

struct MusicPlayer: Widget {
    let kind: String = "MusicPlayer"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            MusicPlayerEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: WidgetFamily.systemLarge) {
    MusicPlayer()
} timeline: {
    SimpleEntry(date: Date.now, configuration: ConfigurationIntent(), song: SeventiesPlaylist.songs[0])
    SimpleEntry(date: Date.now, configuration: ConfigurationIntent(), song: SeventiesPlaylist.songs[1])
    SimpleEntry(date: Date.now, configuration: ConfigurationIntent(), song: SeventiesPlaylist.songs[2])
    SimpleEntry(date: Date.now, configuration: ConfigurationIntent(), song: SeventiesPlaylist.songs[3])
    SimpleEntry(date: Date.now, configuration: ConfigurationIntent(), song: SeventiesPlaylist.songs[4])
}
