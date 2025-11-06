//
//  ContentView.swift
//  APILab
//
//  Created by Andrew Vanderwilt on 11/3/25.
//

import SwiftUI



struct ContentView: View {
    
    let queryItems = [
        "term": "apple",
        "media": "music"
    ]
    
    var body: some View {
        VStack {
            Button("button") {
                Task {
                    do {
                        let searchResults = try await searchItunes(query: queryItems)
                        for result in searchResults {
                            print(
                                """
                                Track Name: \(result.trackName)
                                Artist: \(result.artistName)
                                Description: \(result.description)
                                --
                                """
                            )
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
        .padding()
    }
    
    func searchItunes(query: [String: String]) async throws -> [SongItem] {
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
        urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        let url = urlComponents.url
        let (data, response) = try await URLSession.shared.data(from: url!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw SearchError.Error1 }
        
        let decoder = JSONDecoder()
        let searchResponse = try decoder.decode(SearchResponse.self, from: data)
        
        return searchResponse.results
    }
}

extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
            let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
            let prettyJSONString = String(data: jsonData, encoding: .utf8) else {
            print("Failed to read JSON Object.")
            return
        }
        print(prettyJSONString)
    }
}

struct SongItem: Codable {
    var trackName: String
    var artistName: String
    var kind: String
    var artistID: Int
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case trackName
        case artistName
        case kind
        case artistID = "artistId"
        case description = "description"
        enum AdditionalKeys: String, CodingKey {
            case shortDescription = "shortDescription"
        }
    }
    
    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        trackName = try values.decode(String.self, forKey: .trackName)
        artistName = try values.decode(String.self, forKey: CodingKeys.artistName)
        kind = try values.decode(String.self, forKey: CodingKeys.kind)
        artistID = try values.decode(Int.self, forKey: CodingKeys.artistID)
        
        if let description = try? values.decode(String.self, forKey: CodingKeys.description) {
            self.description = description
        } else {
            let additionalValues = try decoder.container(keyedBy: CodingKeys.AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: CodingKeys.AdditionalKeys.shortDescription)) ?? ""
        }
    }
}

struct SearchResponse: Codable {
    let results: [SongItem]
}

enum SearchError: Error, LocalizedError {
    case Error1
}

#Preview {
    ContentView()
}
