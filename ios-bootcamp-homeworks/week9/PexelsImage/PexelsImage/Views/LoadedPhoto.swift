//
//  LoadedPhoto.swift
//  PexelsImage
//
//  Created by Roman on 10/29/23.
//

import SwiftUI

struct LoadedPhotoView: View {
    @StateObject private var downloader = ImageDownloader()
    let url: String

    var body: some View {
        VStack {
            if let image = downloader.image {
                image
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView(value: downloader.progress, total: 1.0)
                    .progressViewStyle(.linear)
                    .padding(.horizontal)
            }
        }
        .onAppear {
            downloader.downloadImage(from: url)
        }
    }
}

struct LoadedPhoto_Previews: PreviewProvider {
    static var previews: some View {
        LoadedPhotoView(url: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940")
    }
}
