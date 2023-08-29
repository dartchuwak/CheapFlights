//
//  CheapFlights.swift
//  CheapFlights Wildberries
//
//  Created by Evgenii Mikhailov on 28.08.2023.
//

import Foundation

// MARK: - Welcome
class Response:ObservableObject, Codable {
   var flights: [Flight]

    init(flights: [Flight]) {
        self.flights = flights
    }

    enum CodingKeys: CodingKey {
          case flights
      }

      required init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          flights = try container.decode([Flight].self, forKey: .flights)
      }

      func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: CodingKeys.self)
          try container.encode(flights, forKey: .flights)
      }
}

// MARK: - Flight
class Flight: ObservableObject, Identifiable, Codable {
    enum CodingKeys: CodingKey {
        case startDate, endDate, startLocationCode, endLocationCode, startCity, endCity, serviceClass, seats, price, searchToken, isFavorite
    }

    var isFavorite: Bool? = false
    var startDate: String
    var endDate: String
    var startLocationCode: String
    var endLocationCode: String
    var startCity: String
    var endCity: String
    var serviceClass: String
    var seats: [Seat]
    var price: Int
    var searchToken: String

    var id: String {
        return searchToken
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        startDate = try container.decode(String.self, forKey: .startDate)
        endDate = try container.decode(String.self, forKey: .endDate)
        startLocationCode = try container.decode(String.self, forKey: .startLocationCode)
        endLocationCode = try container.decode(String.self, forKey: .endLocationCode)
        startCity = try container.decode(String.self, forKey: .startCity)
        endCity = try container.decode(String.self, forKey: .endCity)
        serviceClass = try container.decode(String.self, forKey: .serviceClass)
        seats = try container.decode([Seat].self, forKey: .seats)
        price = try container.decode(Int.self, forKey: .price)
        searchToken = try container.decode(String.self, forKey: .searchToken)
        isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(startDate, forKey: .startDate)
        try container.encode(endDate, forKey: .endDate)
        try container.encode(startLocationCode, forKey: .startLocationCode)
        try container.encode(endLocationCode, forKey: .endLocationCode)
        try container.encode(startCity, forKey: .startCity)
        try container.encode(endCity, forKey: .endCity)
        try container.encode(serviceClass, forKey: .serviceClass)
        try container.encode(seats, forKey: .seats)
        try container.encode(price, forKey: .price)
        try container.encode(searchToken, forKey: .searchToken)
        try container.encodeIfPresent(isFavorite, forKey: .isFavorite)
    }

    init(startDate: String, endDate: String, startLocationCode: String, endLocationCode: String,
         startCity: String, endCity: String, serviceClass: String, seats: [Seat],
         price: Int, searchToken: String, isFavorite: Bool? = false) {

        self.startDate = startDate
        self.endDate = endDate
        self.startLocationCode = startLocationCode
        self.endLocationCode = endLocationCode
        self.startCity = startCity
        self.endCity = endCity
        self.serviceClass = serviceClass
        self.seats = seats
        self.price = price
        self.searchToken = searchToken
        self.isFavorite = isFavorite
    }
}

// MARK: - Seat
class Seat: Codable {
    var passengerType: String
    var count: Int

    init(passengerType: String, count: Int) {
        self.passengerType = passengerType
        self.count = count
    }
}



