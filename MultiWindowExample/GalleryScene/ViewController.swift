//
//  ViewController.swift
//  MultiWindowExample
//
//  Created by Toshiharu Imaeda on 2022/07/19.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!

  private var dataSource: UICollectionViewDiffableDataSource<SectionId, SectionItem>!
  private let margin: CGFloat = 10
  private var pokemons: [Pokemon] = [] {
    didSet {
      registerPokemonsIntoDataSource(pokemons)
    }
  }

  private enum CellName {
    static let pokemon = "pokemonCell"
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
}

private extension ViewController {
  func setup() {
    title = "Pokemons"

    // Setup collectionView
    collectionView.register(UINib(nibName: String(describing: PokemonGalleryCell.self), bundle: nil),
                            forCellWithReuseIdentifier: CellName.pokemon)
    setupDataSource()
    collectionView.delegate = self

    // Set initial data
    pokemons = PokemonManager.shared.pokemons
  }

  func setupDataSource() {
    dataSource = .init(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
      switch item {
      case .pokemon(let pokemon):
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellName.pokemon, for: indexPath) as! PokemonGalleryCell
        cell.configure(name: pokemon.name, url: pokemon.url)
        return cell
      }
    })
    collectionView.dataSource = dataSource
  }

  func registerPokemonsIntoDataSource(_ data: [Pokemon]) {
    var snapshot = NSDiffableDataSourceSnapshot<SectionId, SectionItem>()
    snapshot.appendSections([.main])
    let items = data.map { SectionItem.pokemon($0) }
    snapshot.appendItems(items)
    dataSource.apply(snapshot)
  }
}

extension ViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("タップされたよ!!")
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    .init(width: 150, height: 150)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return margin
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return margin
  }
}

enum SectionId: String {
  case main
}

enum SectionItem: Hashable, Equatable {
  case pokemon(Pokemon)

  private var id: String {
    switch self {
    case .pokemon(let pokemon):
      return pokemon.id
    }
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }

  static func == (lhs: Self, rhs: Self) -> Bool {
    switch (lhs, rhs) {
    case (.pokemon(let pLhs), .pokemon(let pRhs)):
      return pLhs.id == pRhs.id
    }
  }
}

