//
//  PokemonManager.swift
//  MultiWindowExample
//
//  Created by Toshiharu Imaeda on 2022/07/24.
//

import Foundation

protocol PokemonManagerProtocol {
  var pokemons: [Pokemon] { get }
}

final class PokemonManager: PokemonManagerProtocol {
  static let shared: PokemonManagerProtocol = PokemonManager()
  private init () {}

  let pokemons: [Pokemon] = [
    .init(id: "1", name: "フシギダネ", url: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png"),
    .init(id: "2", name: "フシギソウ", url: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/002.png"),
    .init(id: "3", name: "フシギバナ", url: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/003.png"),
    .init(id: "4", name: "ヒトカゲ", url: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/004.png"),
    .init(id: "5", name: "リザード", url: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/005.png"),
    .init(id: "6", name: "リザードン", url: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/006.png"),
    .init(id: "7", name: "ゼニガメ", url: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/007.png"),
    .init(id: "8", name: "カメール", url: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/008.png"),
    .init(id: "9", name: "カメックス", url: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/009.png"),
  ]
}
