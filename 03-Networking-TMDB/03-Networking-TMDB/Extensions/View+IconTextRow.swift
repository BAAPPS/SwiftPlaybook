//
//  View+IconTextRow.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import Foundation
import SwiftUI

struct IconTextRowModifier: ViewModifier {
    let icon: String
    
    func body(content:Content) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            Image(systemName:icon)
                .foregroundColor(.tmdbPrimary)
            
            content
        }
    }
}


extension View {
    func iconRow(_ icon:String) -> some View {
        self.modifier(IconTextRowModifier(icon:icon))
    }
}
