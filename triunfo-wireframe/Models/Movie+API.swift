//
//  Movie+API.swift
//  FilmADA
//
//  Created by Francisco Soares Neto on 13/07/22.
//

import Foundation

extension Movie {
    
    struct Constants {
        static let POPULAR_PATH_URL = "/3/movie/popular"
        static let API_KEY = "api_key"
    }
    
    static let urlComponents = URLComponents(string: "https://api.themoviedb.org/")!

    // MARK: - Recuperando a chave da API de um arquivo
    static var apiKey: String {
        guard let url = Bundle.main.url(forResource: "TMDB-Info", withExtension: "plist") else {
            fatalError("Couldn't find api key configuration file.")
        }
        guard let plist = try? NSDictionary(contentsOf: url, error: ()) else {
            fatalError("Couldn't interpret api key configuration file as plist.")
        }
        guard let key = plist["API_KEY"] as? String else {
            fatalError("Couldn't find an api key in its configuration file.")
        }
        return key
    }
    
    static func popularMoviesAPI() async -> [Movie] {
        var componets = Movie.urlComponents
        componets.path = Constants.POPULAR_PATH_URL
        componets.queryItems = [
            URLQueryItem(name: Constants.API_KEY, value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from: componets.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResponse = try decoder.decode(MovieResponse.self, from: data)
            return movieResponse.results
        } catch {
            print(error)
        }
        return []
    }
    
    static func downloadImageData(withPath: String) async -> Data {
        let urlString = "https://image.tmdb.org/t/p/w780\(withPath)"
        let url: URL = URL(string: urlString)!
        
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from: url)
            return data
        } catch {
            print(error)
        }
        
        return Data()
    }
}

