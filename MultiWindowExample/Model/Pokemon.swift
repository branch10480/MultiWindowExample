//
//  Pokemon.swift
//  MultiWindowExample
//
//  Created by Toshiharu Imaeda on 2022/07/24.
//

import Foundation


struct Pokemon: Model {
  var id: String
  var name: String
  var url: URL?

  init(id: String, name: String, url: String) {
    self.id = id
    self.name = name
    self.url = URL(string: url)
  }

  var activityUserInfo: [String: Any] {
    [UserActivity.UserInfo.GalleryOpenDetailNameKey: name,
     UserActivity.UserInfo.GalleryOpenDetailUrlKey: url ?? NSNull()]
  }
}
