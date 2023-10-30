//
//  ImageService.swift
//  PexelsImage
//
//  Created by Roman on 10/29/23.
//

import Foundation
@MainActor
class PhotoManager: ObservableObject{
    let apiKey = "D1DrKR2LxBsUsuavIfQbqiIr5E6HBm3jgAmp5GVslam7HRkRSoja7qae"
    let photosPerPage = 30 // maximum allowed by API

    @Published var photos: [Photo] = []
    
    func findPhotos(keyWord: String) async{
        
        var urlString: String {
            return "https://api.pexels.com/v1/search?query=\(keyWord)&per_page=\(photosPerPage)"
        }
        // URL encode the keyword
        let encodedKeyword = keyWord.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        do{
            guard let url = URL(string: urlString) else{ fatalError("Error loading URL" + " for URL string " + "https://api.pexels.com/v1/search?query={\(encodedKeyword)}&per_page=\(photosPerPage)" )}
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue(apiKey, forHTTPHeaderField: "Authorization")
           
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print("Response \((response as! HTTPURLResponse).description)")
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error loading data. Status code")}
            let decoder = JSONDecoder()
            self.photos  = try decoder.decode(ImageResponse.self, from: data).photos
            print(photos.count)
            
        }catch{
            print("Error fetching data")
        }
    }
}

