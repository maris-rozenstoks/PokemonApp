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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //         Do any additional setup after loading the view.
        
        pokemonsImage.sd_setImage(with: URL(string: pokemon!.imageURL))
        pokemonsName.text = pokemon?.name
        pokemonsArtist.text =  pokemon?.hp
        pokemonsType.text = pokemon?.supertype
        pokemonsText.text = pokemon?.text?.joined(separator: "\n")
    }
    
    
}
