//
//  MusicPlayerLiveActivity.swift
//  MusicPlayer
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MusicPlayerAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var playlist: [Song]
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

// Create the views for all configuration types here
struct MusicPlayerLiveActivity: Widget {
    
    // Access the defaults group data with the @AppStorage macro
    // Add the store argument to specify access to the app group instead of the regular User Defaults
    @AppStorage(MusicPlayerAppGroup.Keys.currSong.rawValue, store: MusicPlayerAppGroup.defaultsGroup)
    var currSong: Int = 0
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MusicPlayerAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                createLockScreen(currSong: context.state.playlist[currSong])
            }
            .activityBackgroundTint(Color.black)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    createExpandedLeading(currSong: context.state.playlist[currSong])
                }
                DynamicIslandExpandedRegion(.trailing) {
                    createExpandedTrailing()
                }
                DynamicIslandExpandedRegion(.bottom) {
                    createExpandedBottom(currSong: context.state.playlist[currSong])
                }
            } compactLeading: {
                createCompactLeading(currSong: context.state.playlist[currSong])
            } compactTrailing: {
                createCompactTrailing()
            } minimal: {
                createMinimal(currSong: context.state.playlist[currSong])
            }
            .contentMargins(.leading, 25, for: .expanded)
            .contentMargins(.trailing, 25, for: .expanded)
            .contentMargins(.leading, 10, for: .compactLeading)
        }
    }
}

struct MusicPlayerLiveActivity_Previews: PreviewProvider {
    static let attributes = MusicPlayerAttributes(name: "MusicPlayer")
    static let contentState = MusicPlayerAttributes.ContentState(playlist: SeventiesPlaylist.songs)

    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Lock Screen")
    }
}
