//
//  ViewController.swift
//  Pokedex-HackaTrap
//
//  Created by Michaud Reyna on 1/26/17.
//  Copyright © 2017 Michaud Reyna. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UISearchBarDelegate {

    
    @IBOutlet weak var collection: UICollectionView!
    
    var pokemonArr = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    
    var searchMode:Bool = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        searchBar.delegate = self
        
        intiAudio()
        parseCSV()
        
    }
    
    func intiAudio(){
    
        let path = Bundle.main.path(forResource: "poketune", ofType: "mp3")
        let url = URL(string: path!)
        
        do{
            musicPlayer = try AVAudioPlayer(contentsOf: url! )
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
    }
    
    func parseCSV(){
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let pokeID = Int(row["id"]!)!
                let name = row["identifier"]!
                let poke = Pokemon(name: name, pokedexID: pokeID)
                pokemonArr.append(poke)
            }
            
            print(rows)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func toggleMusicBtn(_ sender: UIButton) {
        
        if musicPlayer.isPlaying == true {
            musicPlayer.stop()
            sender.alpha = 0.2
        } else{
            musicPlayer.play()
            sender.alpha = 1.0
        }
    
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            searchMode = false
        }else{
            searchMode = true
            let lower = searchBar.text!.lowercased()
            
            var filteredPokemon = try pokemonArr.filter({$0.name.range(of: lower) != nil })
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            var poke = pokemonArr[indexPath.row]
            cell.configureCell(poke: poke)
            
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105.0, height: 105.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

