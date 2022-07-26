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
    imageView.setupImage(url: url)
  }

}
