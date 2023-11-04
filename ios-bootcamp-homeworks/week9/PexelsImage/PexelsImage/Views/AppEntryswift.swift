//
//  ContentView.swift
//  PexelsImage
//
//  Created by Roman on 10/29/23.
//

import SwiftUI

struct AppEntry: View {
    @StateObject var photoManager = PhotoManager()
    @State private var searchBarValue = ""
    
    var columns  = [GridItem(.adaptive(minimum: 160),spacing: 20)]
    
    var body: some View {
        NavigationView{
            VStack {
                TextField("Enter photo prompt", text: $searchBarValue)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        Task{
                            if !searchBarValue.isEmpty{
                                await photoManager.findPhotos(keyWord: searchBarValue)
                            }
                            
                        }
                    }
                Spacer()
                
                ScrollView{
                    LazyVGrid(columns: columns){
                        ForEach(photoManager.photos, id: \.id){
                            photo in
                            NavigationLink{
                                LoadedPhotoView(url: photo.src.large2x)
                            } label: {
                                PhotoCard(photo: photo)
                            }
                        }
                    }
                }
                
                
                Spacer()
            }
            .padding()
            .navigationTitle("Photo Store")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppEntry()
    }
}
