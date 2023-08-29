//
//  NetworkService.swift
//  CheapFlights Wildberries
//
//  Created by Evgenii Mikhailov on 28.08.2023.
//

import Foundation

class NetworkService {

    func fetchCheapFlights() async -> Result<Response, NetworkError> {
        let urlString = "https://vmeste.wildberries.ru/stream/api/avia-service/v1/suggests/getCheap"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("vmeste.wildberries.ru", forHTTPHeaderField: "authority")
        request.setValue("application/json, text/plain, */*", forHTTPHeaderField: "accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("https://vmeste.wildberries.ru", forHTTPHeaderField: "origin")
        request.setValue("no-cache", forHTTPHeaderField: "pragma")
        request.setValue("https://vmeste.wildberries.ru/avia", forHTTPHeaderField: "referer")
        request.setValue("empty", forHTTPHeaderField: "sec-fetch-dest")
        request.setValue("cors", forHTTPHeaderField: "sec-fetch-mode")
        request.setValue("same-origin", forHTTPHeaderField: "sec-fetch-site")
        let requestBody = ["startLocationCode": "LED"]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            request.httpBody = jsonData
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return .failure(NetworkError.emptyResponse) }
            let decoder = JSONDecoder()
            let flights = try decoder.decode(Response.self, from: data)
            return .success(flights)
        }
        catch {
            if let urlError = error as? URLError {
                return .failure(.urlSessionError(urlError))
            } else {
                return .failure(.decodingError(error))
            }
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case emptyResponse
    case urlSessionError(Error)
    case decodingError(Error)
}

