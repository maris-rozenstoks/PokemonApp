//
//  PokemonTableViewCell.swift
//  PokemonApp
//
//  Created by maris.rozenstoks on 09/11/2023.
//

import UIKit
import SDWebImage

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonPoints: UILabel!
    @IBOutlet weak var pokemonRarity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupUI(withDataFrom card: Card) {
        pokemonName.text = card.name
        pokemonRarity.text = "Rarity: " + (card.rarity ?? "0")
        pokemonPoints.text = "HP: " + (card.hp ?? "")
        pokemonImageView.sd_setImage(with: URL(string: card.imageURL))
        pokemonType.text = "Type: " + (card.supertype ?? "")
    }
}
