//
//  View+HorizontalDivider.swift
//  02-Networking-NewsAPI
//
//  Created by D F on 6/23/26.
//

import Foundation
import SwiftUI

struct HorizontalDivider: View {
    var opacity: Double = 0.5
    var width: CGFloat = 60
    var height: CGFloat = 1
    
    var body: some View {
        Rectangle()
            .fill(Color.gray.opacity(opacity))
            .frame(width: width, height: height)
            .frame(maxWidth: .infinity)
    }
}
