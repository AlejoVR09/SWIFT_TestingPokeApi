//
//  PokemonManager.swift
//  who is that pokemon
//
//  Created by Alejandro Vanegas Rondon on 19/01/24.
//

import Foundation

protocol PokemonManagerDelegate {
    func didUpdatePokemon(pokemons: [MovieModel])
    func didFailWithError(error: Error)
}

struct PokemonManager {
    var delegate: PokemonManagerDelegate?
    
    let url: String = "https://api.themoviedb.org/3/movie/popular?api_key=176de15e8c8523a92ff640f432966c9c&language=es"
    
    
    func fetchPokemon(){
        self.perfomRequest(with: url)
    }
    
    private func perfomRequest(with urlString: String){
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url){ data, response, error in
                if let error = error {
                    print(error)
                }
                
                if let data = data {
                    if let pokemon = self.parseJSON(pokemonData: data){
                        print(pokemon)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(pokemonData: Data) -> [MovieModel]?{
        do{
            let decodeData = try JSONDecoder().decode(MovieData.self, from: pokemonData)
            let pokemon = decodeData.results?.map{
                MovieModel(adult: $0.adult ?? false, backdropPath: $0.backdropPath ?? "", genreIDS: $0.genreIDS ?? [], id: $0.id ?? 0, originalLanguage: $0.originalLanguage ?? "", originalTitle: $0.originalTitle ?? "", overview: $0.overview ?? "", popularity: $0.popularity ?? 0.0, posterPath: $0.posterPath ?? "", releaseDate: $0.releaseDate ?? "", title: $0.title ?? "", video: $0.video ?? false,  voteAverage: $0.voteAverage ?? 0.0, voteCount: $0.voteCount ?? 0)
            }
            return pokemon
        }catch {
            return nil
        }
    }
}
