//
//  FlightCell.swift
//  CheapFlights Wildberries
//
//  Created by Evgenii Mikhailov on 28.08.2023.
//

import SwiftUI

struct FlightCell: View {
    
    @ObservedObject var viewModel: FlightDetailsViewModel
    var isFavorite: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {

            HStack {
                HStack(spacing: 0) {
                    Text(viewModel.flight.price.description)
                        .fontWeight(.heavy)
                        .font(.system(size: 25))
                        .foregroundColor(.blue)
                        .frame(height: 30)
                    Image(systemName: "rublesign")
                        .font(.system(size: 19, weight: .heavy))
                        .foregroundColor(.blue)
                }
                Spacer()
                Image(systemName: viewModel.isFavorite ? "flame.circle.fill" : "flame.circle")
                    .foregroundColor( viewModel.isFavorite ? .red : .gray)
                    .font(.title2)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .onTapGesture {
                        viewModel.isFavorite.toggle()
                    }
            }

            HStack {
                Text(viewModel.flight.startCity)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                Image(systemName: "airplane")
                    .foregroundColor(.black)
                Text(viewModel.flight.endCity)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
            }

            HStack {
                Image(systemName: "airplane.departure")
                    .foregroundColor(.black)
                HStack {
                    Text(viewModel.startDate)
                        .foregroundColor(.black)
                    Text(viewModel.flight.startLocationCode)
                        .foregroundColor(.gray)
                }
            }

            HStack {
                Image(systemName: "airplane.arrival")
                    .foregroundColor(.black)
                HStack {
                    Text(viewModel.endDate)
                        .foregroundColor(.black)
                    Text(viewModel.flight.endLocationCode)
                        .foregroundColor(.gray)
                }
            }
        }


            .padding()
            .background(Color.white)
            .cornerRadius(30)

    }
}

struct FlightCell_Previews: PreviewProvider {
    static var previews: some View {
        FlightCell(viewModel: FlightDetailsViewModel(flight: Flight(startDate: "2023-09-16 00:00:00 +0000 UTC", endDate: "2023-09-16 00:00:00 +0000 UTC", startLocationCode: "LED", endLocationCode: "MOW", startCity: "Санкт-Петербург", endCity: "Москва", serviceClass: "", seats: [Seat(passengerType: "", count: 1)], price: 200, searchToken: "", isFavorite: true)))
    }
}
