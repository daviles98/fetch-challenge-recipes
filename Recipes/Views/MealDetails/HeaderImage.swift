//
//  HeaderImage.swift
//  Recipes
//
//  Created by Diego 2 on 6/28/24.
//

import SwiftUI

struct HeaderImage: View {
    
    var imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    HeaderImage(imageUrl: "https://www.themealdb.com/images/media/meals/1550442508.jpg")
}
