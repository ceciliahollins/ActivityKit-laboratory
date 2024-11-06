//
//  Song.swift
//  ActivityKit-laboratory
//
//  Created by Hollins, Cecilia on 19/3/2023.
//

import SwiftUI

struct Song: Codable, Hashable {
    let songTitle: String
    let artist: String
    let albumCover: String
    let songLength: String
    let audioFileName: String
}
