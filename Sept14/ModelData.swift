//
//  ModelClass.swift
//  Pods
//
//  Created by Mohammed Jeeshan on 15/09/21.
//
import SwiftUI

struct Link{
    static let ApiLink = "https://api.themoviedb.org/3/movie/popular?api_key=f4d7e6aded05cabd0a316d1b3964e5d7&language=en-US&page=1"
    static let pathLink = "https://image.tmdb.org/t/p/w500"
}

struct MovieModel : Codable {
    let page : Int?
    let results : [Results]?
    let total_results : Int?
    let total_pages : Int?
}

struct Results : Codable, Identifiable {
    let poster_path : String?
    let adult : Bool?
    let overview : String?
    let release_date : String?
    let genre_ids : [Int]?
    let id : Int?
    let original_title : String?
    let original_language : String?
    let title : String?
    let backdrop_path : String?
    let popularity : Double?
    let vote_count : Int?
    let video : Bool?
    let vote_average : Float?
}

