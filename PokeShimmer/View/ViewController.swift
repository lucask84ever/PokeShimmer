//
//  ViewController.swift
//  PokeShimmer
//
//  Created by lucas.lima on 05/03/21.
//  Copyright © 2021 lucas.lima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    var viewModel: PokedexViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel = PokedexViewModel()
        viewModel.delegate = self
        setupCollectionView()
        loadData()
    }
    
    private func setupCollectionView() {
        pokemonCollectionView.register(UINib(nibName: String(describing: PokemonCollectionViewCell.self), bundle: Bundle(for: Self.self)), forCellWithReuseIdentifier: "pokeCell")
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
    }
    
    private func loadData() {
        viewModel.retrieveData()
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getPokemons().count > 0 ? viewModel.getPokemons().count : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokeCell", for: indexPath) as? PokemonCollectionViewCell {
            
            if !viewModel.getPokemons().isEmpty {
                let model = viewModel.getPokemons()[indexPath.row]
                cell.setup(with: model)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 40
        let height = 1.25 * width
        return CGSize(width: width, height: height)
    }
}

extension ViewController: PokedexDelegate {
    func onSuccess() {
        DispatchQueue.main.async {
            self.pokemonCollectionView.reloadData()
        }
    }
    
    func onError(_ error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Pokérror!", message: error.localizedDescription, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.show(alert, sender: nil)
        }
    }
}
