//
//  CheapFlightViewModel.swift
//  CheapFlights Wildberries
//
//  Created by Evgenii Mikhailov on 28.08.2023.
//

import Foundation
import SwiftUI

class CheapFlightsViewModel: ObservableObject {

    let networkService: NetworkService

    @Published var flights: [Flight] = []
    @Published var isLoading: Bool = true

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchFlights() {
        Task {
            let result = await networkService.fetchCheapFlights()
            switch result {
            case .success (let resonse):
                DispatchQueue.main.async {
                    self.flights.append(contentsOf: resonse.flights)
                    self.isLoading = false
                }
            case .failure(let error):
                print (error)
            }
        }
    }
}
