//
//  PokemonTableViewController.swift
//  PokemonApp
//
//  Created by maris.rozenstoks on 09/11/2023.
//
import UIKit

class PokemonTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - Properties
    
    var pokey: [Card] = []
    var filteredPokey: [Card] = []
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchPokemon: UISearchBar!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPokemonData()
        setupSearchBar()
    }
    
    // MARK: - Search Functionality
    func setupSearchBar() {
        searchPokemon.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            // If the search bar is empty, show all cards.
            filteredPokey = pokey
        } else {
            // Filter the cards based on the search text.
            filteredPokey = pokey.filter { card in
                return card.name.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
    
    // MARK: - Data Loading
    func loadPokemonData() {
        let jsonUrl = "https://api.pokemontcg.io/v1/cards"
        
        guard let url = URL(string: jsonUrl) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request) { data, response, error in
            if error != nil {
                print((error?.localizedDescription)!)
            }
            
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(Pokemon.self, from: data)
                dump(jsonData)
                self.pokey = jsonData.cards
                
                DispatchQueue.main.async {
                    self.filteredPokey = self.pokey // Set filteredPokey to all cards initially
                    self.tableView.reloadData()
                }
                
            } catch {
                print("error:::::" , error)
            }
            
        }.resume()
    }
    
    // MARK: - Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPokey.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        let poke = filteredPokey[indexPath.row]
        cell.setupUI(withDataFrom: poke)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pokemonDetailSegue" {
            guard let destinationVC = segue.destination as? PokemonDetailViewController, let row = tableView.indexPathForSelectedRow?.row else { return
            }
            destinationVC.pokemon = pokey[row]
        }
    }
}
