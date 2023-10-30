//
//  ImageResponse.swift
//  PexelsImage
//
//  Created by Roman on 10/29/23.
//

import Foundation

struct ImageResponse: Codable {
    var total_results: Int
    var page: Int
    var per_page: Int
    var photos: [Photo]
    var next_page: String
}

struct Photo: Codable {
    var id: Int
    var width: Int
    var height: Int
    var url: String
    var photographer: String
    var photographer_url: String
    var photographer_id: Int
    var avg_color: String
    var src: Source
    var liked: Bool
    var alt: String
}

struct Source: Codable {
    var original: String
    var large2x: String
    var large: String
    var medium: String
    var small: String
    var portrait: String
    var landscape: String
    var tiny: String
}

struct PhotoExample {
    static var photo : Photo {
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
        return photoCard
        
    }
}
