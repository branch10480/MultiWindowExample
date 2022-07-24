//
//  PokemonGalleryCell.swift
//  MultiWindowExample
//
//  Created by Toshiharu Imaeda on 2022/07/24.
//

import UIKit

class PokemonGalleryCell: UICollectionViewCell {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    layer.masksToBounds = true
    layer.cornerRadius = 10
  }

  func configure(name: String, url: URL?) {
    nameLabel.text = name
    Task.detached { [weak self] in
      do {
        try? await self?.imageView.downloadAndSetImage(url: url)
      }
    }
  }

}
