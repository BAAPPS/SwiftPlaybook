//
//  View+VerticalDivider.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/23/26.
//

import Foundation
import SwiftUI

struct VerticalDivider: View {
    var height: CGFloat = 14

    var body: some View {
        Rectangle()
            .frame(width: 1, height: height)
            .foregroundColor(.secondary.opacity(0.5))
    }
}
