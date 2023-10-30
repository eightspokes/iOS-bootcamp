//
//  ImageDownloader.swift
//  PexelsImage
//
//  Created by Roman on 10/29/23.
//
import SwiftUI
import Foundation
import UIKit

class ImageDownloader: NSObject, ObservableObject {
    @Published var image: Image?
    @Published var progress: Double = 0.0
    private var session: URLSession?

    override init() {
        super.init()
        let configuration = URLSessionConfiguration.default
        self.session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }

    func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = session?.downloadTask(with: url)
        task?.resume()
    }
}

extension ImageDownloader: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        DispatchQueue.main.async {
            self.progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
        }
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        do {
            let data = try Data(contentsOf: location)
            if let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                }
            }
        } catch {
            print("Error converting downloaded data to image: \(error)")
        }
    }
}
