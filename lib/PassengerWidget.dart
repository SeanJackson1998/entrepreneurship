import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DriverTrip.dart';

class PassengerWidget extends StatelessWidget {
  final Passenger passenger;

  PassengerWidget(this.passenger);

  @override
  Widget build(BuildContext context) {
    return Container(
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

        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[Text("Name: ${passenger.name}")]),
            const SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[Text("Rating: ${passenger.rating}")]),
          ]),
          const SizedBox(width: 40),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Text("Destination: ${passenger.destination}")
            ]),
            const SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[Text("Luggage: ${passenger.luggage}")]),
          ])
        ]));
  }
}
