import 'package:flutter/material.dart';
import 'package:flutter_app/DriverTrip.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:open_iconic_flutter/open_iconic_flutter.dart';

import 'DriverTripPageWidget.dart';

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
              color: Colors.lightBlue,
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
                      Icon(
                        Icons.pin_drop,
                        size: 15.0,
                      ),
                      Text(" ${trip.trip.destination}",
                          style: TextStyle(fontSize: 15))
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(MdiIcons.clock),
                      Text(
                        "  ${trip.trip.timestamp}",
                        style: TextStyle(fontSize: 15),
                      )
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        OpenIconicIcons.envelopeClosed,
                      ),
                      Text(
                        "  ${trip.requests.length}",
                        style: TextStyle(fontSize: 15),
                      )
                    ])
              ]),
              const SizedBox(width: 30),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(MdiIcons.seatPassenger),
                      Text("  ${trip.car.length}")
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(MdiIcons.carSeat),
                      Text("  ${trip.trip.passengers}")
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(MdiIcons.briefcasePlus),
                      Text("  ${trip.trip.luggage}")
                    ])
              ]),
              const SizedBox(width: 30),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(height: 10),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text("£${(trip.trip.price).round()}",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                )
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
