//
//  CheapFlights_WildberriesApp.swift
//  CheapFlights Wildberries
//
//  Created by Evgenii Mikhailov on 28.08.2023.
//

import SwiftUI

@main
struct CheapFlights_WildberriesApp: App {

    let networkService: NetworkService
    let mainViewModel: CheapFlightsViewModel

    init() {
        self.networkService = NetworkService()
        self.mainViewModel = CheapFlightsViewModel(networkService: networkService)
    }

    var body: some Scene {
        WindowGroup {
            MainView(viewModel: mainViewModel)
                .onAppear {
                    mainViewModel.fetchFlights()
                }
        }
    }
}
