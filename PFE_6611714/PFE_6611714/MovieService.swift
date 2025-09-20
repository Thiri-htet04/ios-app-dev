//
//  MovieService.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//
import Foundation

public enum MovieAPIError: LocalizedError {
    case badURL, unexpectedShape, network(Error)
    public var errorDescription: String? {
        switch self {
        case .badURL: return "Bad URL."
        case .unexpectedShape: return "Unexpected response shape."
        case .network(let e): return e.localizedDescription
        }
    }
}

private struct MoviesWrapperA: Decodable { let movies: [Movie]? }
private struct MoviesWrapperB: Decodable { let movie: [Movie]? }
private struct MoviesWrapperC: Decodable { let data: [Movie]? }

public struct MovieService {
    private static let endpoint = "https://www.majorcineplex.com/apis/get_movie_avaiable"

    public static func fetchAvailableMovies() async throws -> [Movie] {
        guard let url = URL(string: endpoint) else { throw MovieAPIError.badURL }

        var req = URLRequest(url: url)
        req.setValue("application/json", forHTTPHeaderField: "Accept")
        req.setValue("Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1",
                     forHTTPHeaderField: "User-Agent") // some endpoints are picky

        do {
            let (data, response) = try await URLSession.shared.data(for: req)
            if let http = response as? HTTPURLResponse, http.statusCode != 200 {
                throw MovieAPIError.network(NSError(domain: "HTTP", code: http.statusCode, userInfo: [NSLocalizedDescriptionKey: "HTTP \(http.statusCode)"]))
            }

            let decoder = JSONDecoder()

            if let list = try? decoder.decode([Movie].self, from: data) { return dedupe(list) }
            if let w = try? decoder.decode(MoviesWrapperA.self, from: data), let m = w.movies { return dedupe(m) }
            if let w = try? decoder.decode(MoviesWrapperB.self, from: data), let m = w.movie  { return dedupe(m) }
            if let w = try? decoder.decode(MoviesWrapperC.self, from: data), let m = w.data   { return dedupe(m) }

    
            if let dict = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] {
                for key in ["now_showing","nowshowing","upcoming","results","result","items"] {
                    if let arr = dict[key] as? [[String: Any]] {
                        let arrData = try JSONSerialization.data(withJSONObject: arr)
                        if let m = try? decoder.decode([Movie].self, from: arrData) { return dedupe(m) }
                    }
                }
            }

            throw MovieAPIError.unexpectedShape
        } catch let e as MovieAPIError {
            throw e
        } catch {
            throw MovieAPIError.network(error)
        }
    }

    private static func dedupe(_ movies: [Movie]) -> [Movie] {
        var seen = Set<String>()
        return movies.filter { seen.insert($0.id).inserted }
    }
}
