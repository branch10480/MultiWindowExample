//
//  UIImageView+.swift
//  MultiWindowExample
//
//  Created by Toshiharu Imaeda on 2022/07/24.
//

import Foundation
import UIKit

extension UIImageView {
  func downloadAndSetImage(url: URL?) async throws {
    guard let url = url else {
      self.image = nil
      return
    }

    do {
      let configuration = URLSessionConfiguration.default
      configuration.requestCachePolicy = .returnCacheDataElseLoad
      let session = URLSession(configuration: configuration)
      let (data, response) = try await session.data(from: url)

      guard let response = response as? HTTPURLResponse else {
        throw ApiError.responseError
      }

      switch response.statusCode {
      case 200..<400:
        let image = UIImage(data: data)
        self.image = image

      case 400...:
        throw ApiError.badStatusError(statusCode: response.statusCode)

      default:
        throw ApiError.responseError
      }
    } catch(let e) {
      throw e
    }
  }
}
