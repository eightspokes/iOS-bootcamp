import UIKit
import Foundation
let fileName = "apilist"
let fileType = "json"

let fileManagerPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
let reminderDataURL = URL(fileURLWithPath: "\(fileName).\(fileType)", relativeTo: fileManagerPath)
let stringURL = fileManagerPath
  .appendingPathComponent(fileName)
  .appendingPathExtension(fileType)
