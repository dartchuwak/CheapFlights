//
//  ContentView.swift
//  CheapFlights Wildberries
//
//  Created by Evgenii Mikhailov on 28.08.2023.
//

import SwiftUI

struct MainView: View {

    @ObservedObject var viewModel: CheapFlightsViewModel

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
            } else {
                ScrollView {
                    Spacer().frame(height: 8)
                    ForEach(viewModel.flights) { flight in

                        let viewModel = FlightDetailsViewModel(flight: flight)

                        NavigationLink {
                            FlightDetailsView(viewModel: viewModel)
                        } label: {
                            FlightCell(viewModel: viewModel)
                                .padding(.horizontal)
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding(.top)
            }
        }
        .onAppear {
            viewModel.fetchFlights()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: CheapFlightsViewModel(networkService: NetworkService()))
    }
}
