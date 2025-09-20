//
//  CinemaService.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//

import Foundation

public enum CinemaAPIError: LocalizedError {
    case badURL, unexpectedShape, network(Error)
    public var errorDescription: String? {
        switch self {
        case .badURL: return "Bad URL."
        case .unexpectedShape: return "Unexpected response shape."
        case .network(let e): return e.localizedDescription
        }
    }
}

private struct WrapperA: Decodable { let cinemas: [Cinema]? }
private struct WrapperB: Decodable { let cinema:  [Cinema]? }
private struct WrapperC: Decodable { let data:    [Cinema]? }

public struct CinemaService {
    private static let endpoint = "https://www.majorcineplex.com/apis/get_cinema"

    public static func fetchCinemas() async throws -> [Cinema] {
        guard let url = URL(string: endpoint) else { throw CinemaAPIError.badURL }

        var req = URLRequest(url: url)
        req.setValue("application/json", forHTTPHeaderField: "Accept")

        do {
            let (data, _) = try await URLSession.shared.data(for: req)
            let dec = JSONDecoder()

            if let a = try? dec.decode([Cinema].self, from: data) { return dedupe(a) }
            if let w = try? dec.decode(WrapperA.self, from: data), let v = w.cinemas { return dedupe(v) }
            if let w = try? dec.decode(WrapperB.self, from: data), let v = w.cinema  { return dedupe(v) }
            if let w = try? dec.decode(WrapperC.self, from: data), let v = w.data    { return dedupe(v) }

   
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                for key in ["cinemas","cinema","data","results","items"] {
                    if let arr = json[key] as? [[String: Any]] {
                        let sub = try JSONSerialization.data(withJSONObject: arr)
                        if let v = try? dec.decode([Cinema].self, from: sub) { return dedupe(v) }
                    }
                }
            }
            throw CinemaAPIError.unexpectedShape
        } catch let e as CinemaAPIError {
            throw e
        } catch {
            throw CinemaAPIError.network(error)
        }
    }

    private static func dedupe(_ xs: [Cinema]) -> [Cinema] {
        var seen = Set<String>(); return xs.filter { seen.insert($0.id).inserted }
    }
}
