//
//  UserActivity.swift
//  MultiWindowExample
//
//  Created by Toshiharu Imaeda on 2022/07/24.
//

import Foundation

struct UserActivity {
  static let GalleryOpenDetailActivityType = "me.toshi-sv.MultiWindowExample.openDetail"
  static let GalleryOpenInspectionActivityType = "me.toshi-sv.MultiWindowExample.openInspection"

  struct UserInfo {
    // NSUserActivity の UserInfo Key
    static let GalleryOpenDetailNameKey = "pokemonName"
    static let GalleryOpenDetailUrlKey = "pokemonUrl"
  }
}
