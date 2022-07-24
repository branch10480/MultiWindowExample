//
//  Error.swift
//  MultiWindowExample
//
//  Created by Toshiharu Imaeda on 2022/07/24.
//

import Foundation

enum ApiError: Error {
  case responseError
  case badStatusError(statusCode: Int)
}
