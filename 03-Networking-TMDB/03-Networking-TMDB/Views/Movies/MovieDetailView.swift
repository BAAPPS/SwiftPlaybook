//
//  MovieDetailView.swift
//  03-Networking-TMDB
//
//  Created by D F on 7/7/26.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View{
        ScrollView {
            VStack(spacing:0){
                AsyncImage(url: movie.posterURL(size: .w780)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    default:
                        Color.gray
                    }
                }
                .frame(maxWidth: .infinity)
                .clipped()
                
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    HStack {
                        Text(movie.title)
                            .font(.system(size: 20, weight: .bold))
                            .lineLimit(1)
                        
                        VerticalDivider()
                        
                        HStack(spacing: 6) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            
                            Text(String(format: "%.1f", movie.voteAverage))
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.secondary)
                        }
                    }
                    .frame(maxWidth:.infinity, alignment:.center)
                    
                    HStack(alignment: .firstTextBaseline, spacing: 10){
                        
                        if let date = movie.releaseDate {
                            Text(TMDBDateHelper.formatDisplayDate(date))
                                .iconRow("calendar")
                                .padding(.top, 5)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        VerticalDivider()
                        
                        Text(movie.originalLanguage)
                            .iconRow("globe")
                            .padding(.top, 5)
                            .font(.system(size: 16, weight: .semibold))
                        VerticalDivider()
                        
                        Text(String(format: "%.0f", movie.popularity))
                            .iconRow("chart.line.uptrend.xyaxis")
                            .padding(.top, 5)
                            .font(.system(size: 16, weight: .semibold))
                        
                    }
                    .padding(.vertical, 10)
                    .frame(maxWidth:.infinity, alignment:.center)
                    
                    if let overview = movie.overview {
                        Text(overview)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.secondary)
                            .lineSpacing(8)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                    }
                    
                }
                .padding(10)
                
            }
        }
        .ignoresSafeArea(edges: .top)
        
    }
}

#Preview {
    NavigationStack {
        MovieDetailView(movie: .mock)
    }
}
