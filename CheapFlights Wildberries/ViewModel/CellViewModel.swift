//
//  CellViewModel.swift
//  CheapFlights Wildberries
//
//  Created by Evgenii Mikhailov on 28.08.2023.
//

import Foundation

class FlightCellViewModel: ObservableObject {

    var flight: Flight
    var startDate: String {
        return traslateDate(input: flight.startDate)
    }

    var endDate: String {
        return traslateDate(input: flight.endDate)
    }

    @Published var isFavorite: Bool = false

    init(flight: Flight) {
        self.flight = flight
    }

    func traslateDate(input: String) -> String {
        var output = ""
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")

        if let date = inputFormatter.date(from: String(input.prefix(19))) {
            let outputFormatter = DateFormatter()
            outputFormatter.locale = Locale(identifier: "ru_RU")
            outputFormatter.dateFormat = "d MMMM yyyy"
            output = outputFormatter.string(from: date)
        }
        return output
    }
}
