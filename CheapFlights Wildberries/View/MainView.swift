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
            VStack(spacing: 0) {
                Text("Пора в путешествие!")
                    .font(.system(size: 24, weight: .bold))
                Spacer()

                if viewModel.isLoading {
                    Text("Загрузка...")
                        .padding()
                        .foregroundColor(.gray)
                    ProgressView()
                        .scaleEffect(1.5)
                    Spacer()
                } else {
                    ScrollView {
                        Spacer().frame(height: 8)
                        ForEach(viewModel.flights, id: \.id) { flight in
                            let exFlight = flight
                            NavigationLink {
                                let viewModel = FlightDetailsViewModel(flight: exFlight)
                                FlightDetailsView(viewModel: viewModel)
                            } label: {
                                let viewModel = FlightCellViewModel(flight: exFlight)
                                FlightCell(viewModel: viewModel)

                                    .padding(.horizontal)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                    .padding(.top)
                }
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: CheapFlightsViewModel(networkService: NetworkService()))
    }
}
