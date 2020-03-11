import 'package:flutter/material.dart';
import 'package:flutter_app/DriverTrip.dart';

import 'DriverTripPageWidget.dart';
import 'TripWidgetPage.dart';

class DriverTripWidget extends StatelessWidget {
  final DriverTrip trip;

  DriverTripWidget(this.trip);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print(
              "Clicked the widget with trip id ${this.trip.trip.tripId}"); // use this to go to the next screen with param trip
          navigateToNextPage(context, trip);
        },
        child: Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            // Add components for the widget

            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Destination: ${trip.trip.destination}")
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Timestamp: ${trip.trip.timestamp}")
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Requests: ${trip.requests.length}")
                    ])
              ]),
              const SizedBox(width: 40),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Current Passengers: ${trip.car.length}")
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Passenger Spaces: ${trip.trip.passengers}")
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Luggage Spaces: ${trip.trip.luggage}")
                    ])
              ])
            ])));
  }

  Future navigateToNextPage(context, trip) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DriverTripPageWidget(trip: trip)));
  }
}
