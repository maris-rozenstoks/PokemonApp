//
//  ViewController.swift
//  PokemonApp
//
//  Created by maris.rozenstoks on 09/11/2023.
//

import UIKit
import SDWebImage

class PokemonDetailViewController: UIViewController {
    
    var pokemon: Card?
    
    @IBOutlet weak var pokemonsImage: UIImageView!
    @IBOutlet weak var pokemonsName: UILabel!
    @IBOutlet weak var pokemonsArtist: UILabel!
    @IBOutlet weak var pokemonsType: UILabel!
    @IBOutlet weak var pokemonsText: UILabel!
    @IBOutlet weak var pokemonsHp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //         Do any additional setup after loading the view.
        
        pokemonsImage.sd_setImage(with: URL(string: pokemon!.imageURL))
        pokemonsName.text = pokemon?.name
        pokemonsArtist.text =  pokemon?.artist
        pokemonsType.text = pokemon?.supertype
        if let hp = pokemon?.hp {
                    pokemonsHp.text = "HP: \(hp)"
                } else {
                    pokemonsHp.text = "HP: N/A"
                }
        pokemonsText.text = pokemon?.text?.joined(separator: "\n")
    }
    
    
}
