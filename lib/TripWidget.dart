import 'package:flutter/material.dart';

import 'Trip.dart';
import 'TripWidgetPage.dart';

class TripWidget extends StatelessWidget {
  final Trip trip;

  TripWidget(this.trip);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print(
              "Clicked the widget with trip id ${this.trip.tripId}"); // use this to go to the next screen with param trip
          navigateToNextPage(context, trip);
        },
        child: Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              border: Border.all(
                color: Colors.black,
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
                    children: <Widget>[Text("Driver Name: ${trip.name}")]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Destination: ${trip.destination}")
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[Text("Timestamp: ${trip.timestamp}")])
              ]),
              const SizedBox(width: 40),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[Text("Rating: ${trip.rating}")]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[Text("Passengers: ${trip.passengers}")]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[Text("Luggage Space: ${trip.luggage}")])
              ])
            ])));
  }

  Future navigateToNextPage(context, trip) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TripPageWidget(trip: trip)));
  }
}