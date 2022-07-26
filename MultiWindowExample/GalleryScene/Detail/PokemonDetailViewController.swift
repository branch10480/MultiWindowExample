//
//  PokemonDetailViewController.swift
//  MultiWindowExample
//
//  Created by Toshiharu Imaeda on 2022/07/26.
//

import UIKit

class PokemonDetailViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!

  var pokemon: Pokemon?

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

  private func setup() {
  }

  private func updateView(pokemon: Pokemon?) {
    title = pokemon?.name ?? "Pokemon Detail"
    imageView.setupImage(url: pokemon?.url)
  }

}
