/// Copyright (c) 2023 Kodeco Inc.
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.


import Foundation

class APIStore {
  static let shared = APIStore()
  let fileName = "apilist"
  let fileType = "json"
  
  func loadAPIs(completion: @escaping (Result<APIDetails, Error>) -> Void) {
    loadAPIsFromBundle(from: fileName, with: fileType) {  bundleResult in
      //Try loading from Bundle
      if case .success(let apis) = bundleResult {
        writeData(apis, to: self.fileName, with: self.fileType)
        completion(.success(apis))
      //Try loading from Documents
      }else{
        loadAPIsFromDocuments(from: self.fileName, with: self.fileType) {  documentsResult in
          if case .success(let apis) = documentsResult {
            writeData(apis, to: self.fileName, with: self.fileType)
            completion(.success(apis))
            
          }else{
            let error = NSError(domain: "Could not load files", code: 404, userInfo: nil)
            completion(.failure(error))
          }
        }
      }
    }
    
  func writeData<T: Encodable>(_ object: T, to fileName: String, with fileType: String) {
      let encoder = JSONEncoder()
      do {
        // Encode the object to JSON data
        let jsonData = try encoder.encode(object)
        
        // Get the document directory URL
        if let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
          // Construct the file URL using the given file name
          let fileURL = documentDirectoryURL.appendingPathComponent(fileName).appendingPathExtension(fileType)
          try jsonData.write(to: fileURL, options: .atomic)
          print("JSON data successfully written to \(fileURL)")
        } else {
          print("Document directory URL is not available.")
        }
      } catch {
        print("Error encoding JSON object: \(error)")
      }
    }
    func loadAPIsFromBundle(from fileName: String, with extension: String, completion: @escaping (Result<APIDetails, Error>) -> Void) {
      // Attempt to load JSON data from the app bundle
      if let path = Bundle.main.path(forResource: fileName , ofType: `extension`) {
        do {
          let data = try Data(contentsOf: URL(fileURLWithPath: path))
          let apis = try JSONDecoder().decode(APIDetails.self, from: data)
          completion(.success(apis))
        } catch {
          completion(.failure(error))
        }
      } else {
        
        let error = NSError(domain: "Could not find \(fileName) in Bundle", code: 404, userInfo: nil)
        completion(.failure(error))
      }
    }
    
    func loadAPIsFromDocuments(from fileName: String, with extension: String, completion: @escaping (Result<APIDetails, Error>) -> Void) {
      if let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        // Construct the file URL using the given file name
        let fileURL = documentDirectoryURL.appendingPathComponent(fileName).appendingPathExtension(`extension`)
        
        do {
          // Attempt to load JSON data from the specified file URL
          let data = try Data(contentsOf: fileURL)
          let apis = try JSONDecoder().decode(APIDetails.self, from: data)
          completion(.success(apis))
        } catch {
          completion(.failure(error))
        }
      } else {
        let error = NSError(domain: "Could not find \(fileName) in Documents", code: 404, userInfo: nil)
        completion(.failure(error))
      }
    }
  }
}
