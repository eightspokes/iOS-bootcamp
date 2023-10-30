//
//  PhotoCard.swift
//  PexelsImage
//
//  Created by Roman on 10/29/23.
//

import SwiftUI

struct PhotoCard: View {
    let photo: Photo
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomTrailing){
                AsyncImage(url: URL(string: photo.src.tiny)){
                    image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 250)
                        .cornerRadius(30)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.1))
                        .frame(width: 150, height: 250)
                        .cornerRadius(30)
                }
                VStack(alignment: .leading){
                    Text("Name")
                        .font(.caption)
                        .bold()
                    Text("Author")
                        .multilineTextAlignment(.leading)
                        
                }
                .padding()
                .foregroundColor(.white)
                .shadow(radius: 1)
            }
            Image(systemName: "square.and.arrow.down")
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(50)
        }
    }
}

struct PhotoCard_Previews: PreviewProvider {
    static var previews: some View {
        let source = Source (
            original: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png",
            large2x: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            large: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=650&w=940",
            medium: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=350",
            small: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=130",
            portrait: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
            landscape: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280",
            tiny: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280")
        let photoCard = Photo(id: 3573351, width: 3066, height: 3968, url: "https://www.pexels.com/photo/trees-during-day-3573351/", photographer: "Lukas Rodriguez", photographer_url: "https://www.pexels.com/@lukas-rodriguez-1845331", photographer_id: 1845331, avg_color: "#374824", src: source, liked: false , alt: "Brown Rocks During Golden Hour")
        PhotoCard(photo: photoCard)
    }
}

