//
//  ViewController.swift
//  TestingApis
//
//  Created by Alejandro Vanegas Rondon on 25/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    var movieManaeger = PokemonManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        movieManaeger.fetchPokemon()
        // Do any additional setup after loading the view.
    }


}

