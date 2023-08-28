//
//  CheapFlights.swift
//  CheapFlights Wildberries
//
//  Created by Evgenii Mikhailov on 28.08.2023.
//

import Foundation

// MARK: - Welcome
struct Response: Codable,Hashable {
    let flights: [Flight]
}

// MARK: - Flight
struct Flight: Codable, Hashable, Identifiable {
    let startDate: String
    let endDate: String
    let startLocationCode: String
    let endLocationCode: String
    let startCity: String
    let endCity, serviceClass: String
    let seats: [Seat]
    let price: Int
    let searchToken: String
    var isFavorite: Bool?
    var id: String { return searchToken }
}

// MARK: - Seat
struct Seat: Codable,Hashable {
    let passengerType: String
    let count: Int
}
