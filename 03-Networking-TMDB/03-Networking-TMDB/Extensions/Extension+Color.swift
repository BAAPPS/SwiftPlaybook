//
//  Extension+Color.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import Foundation
import SwiftUI

extension Color {

    // MARK: - Brand / Accent
    static let tmdbPrimary = Color(
        red: 26/255,
        green: 115/255,
        blue: 232/255
    )

    // MARK: - Backgrounds
    static let tmdbBackground = Color(
        red: 18/255,
        green: 18/255,
        blue: 20/255
    )

    static let tmdbSecondaryBackground = Color(
        red: 28/255,
        green: 28/255,
        blue: 30/255
    )

    // MARK: - Text
    static let tmdbPrimaryText = Color.white
    static let tmdbSecondaryText = Color.gray

    // MARK: - UI Elements
    static let tmdbDivider = Color.white.opacity(0.08)
}
