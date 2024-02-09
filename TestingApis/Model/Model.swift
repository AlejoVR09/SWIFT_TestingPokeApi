//
//  Model.swift
//  TestingApis
//
//  Created by Alejandro Vanegas Rondon on 25/01/24.
//

import Foundation

struct MovieModel {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
