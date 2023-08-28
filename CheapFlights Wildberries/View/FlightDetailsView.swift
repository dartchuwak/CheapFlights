//
//  FlightDetailsView.swift
//  CheapFlights Wildberries
//
//  Created by Evgenii Mikhailov on 28.08.2023.
//

import SwiftUI

struct FlightDetailsView: View {
    @ObservedObject var viewModel: FlightDetailsViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text("\(viewModel.flight.startCity) — \(viewModel.flight.endCity)")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .lineLimit(1)
                    .textCase(.uppercase)
                    .minimumScaleFactor(0.2)
                Spacer()
                Image(systemName: viewModel.isFavorite ? "flame.circle.fill" : "flame.circle")
                    .font(.system(size: 22))
                    .foregroundColor(viewModel.isFavorite ? .red : .gray)
                    .onTapGesture {
                        viewModel.isFavorite.toggle()
                    }
            }

            HStack(spacing: 0) {
                Text("Цена:")
                Spacer().frame(width: 5)
                Text(viewModel.flight.price.description)
                    .fontWeight(.heavy)
                    .font(.system(size: 25))
                    .foregroundColor(.blue)
                    .frame(height: 30)
                Image(systemName: "rublesign")
                    .font(.system(size: 19, weight: .heavy))
                    .foregroundColor(.blue)
            }

            HStack {
                VStack {
                    Text(viewModel.startDate)
                    Spacer()
                    Text(viewModel.endDate)
                }

                Rectangle().frame(width: 2, height: 200)
                    .foregroundColor(.purple)

                VStack(alignment: .leading) {
                    Text(viewModel.flight.startCity)
                        .font(.system(size: 18, weight: .semibold, design: .default))
                    Text(viewModel.flight.startLocationCode)
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(Color(white: 0.5))
                    Spacer()
                    Image(systemName: "airplane")
                        .rotationEffect(Angle(degrees: 90))
                    Spacer()
                    Text(viewModel.flight.endCity)
                        .font(.system(size: 18, weight: .semibold, design: .default))
                    Text(viewModel.flight.endLocationCode)
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(Color(white: 0.5))
                }
            }
            .frame(height: 200)
        }

        .padding()
    }
}


struct FlightDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailsView(viewModel: FlightDetailsViewModel(flight: Flight(startDate: "2023-09-16 00:00:00 +0000 UTC", endDate: "2023-09-16 00:00:00 +0000 UTC", startLocationCode: "LED", endLocationCode: "MOW", startCity: "Санкт-Петербург", endCity: "Москва", serviceClass: "", seats: [Seat(passengerType: "", count: 1)], price: 200, searchToken: "TOKEN", isFavorite: true)))
    }
}
