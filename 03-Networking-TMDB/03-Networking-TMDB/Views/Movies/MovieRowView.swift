//
//  MovieRowView.swift
//  03-Networking-TMDB
//
//  Created by D F on 6/23/26.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    var body: some View {
        HStack(alignment:.top, spacing: 10) {
            AsyncImage(url: movie.posterURL(size: .w200)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                default:
                    Image(systemName: "film")
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 70, height: 110)
            .cornerRadius(8)
            .clipped()
            VStack(alignment: .leading, spacing: 6) {
                
                HStack {
                    Text(movie.title)
                        .font(.headline)
                        .lineLimit(1)
                    
                    VerticalDivider()
                    
                    HStack(spacing: 6) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text(String(format: "%.1f", movie.voteAverage))
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .bold()
                    }
                }
                
                
                if let overview = movie.overview {
                    Text(overview)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(5)
                }
                
                
                if let date = movie.releaseDate {
                    Text(TMDBDateHelper.formatDisplayDate(date))
                        .iconRow("calendar")
                        .padding(.top, 5)
                        .font(.caption)
                }
                
                
            }
            .padding(10)
            
            Spacer(minLength: 0)
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        
    }
}

#Preview {
    MovieRowView(movie: .mock)
}
