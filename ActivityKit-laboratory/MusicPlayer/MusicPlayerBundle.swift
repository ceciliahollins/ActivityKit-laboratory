//
//  MusicPlayerBundle.swift
//  MusicPlayer
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import WidgetKit
import SwiftUI

@main
struct MusicPlayerBundle: WidgetBundle {
    var body: some Widget {
        MusicPlayer()
        MusicPlayerLiveActivity()
    }
}
