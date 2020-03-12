import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:rating_bar/rating_bar.dart';

import 'Trip.dart';
import 'TripWidgetPage.dart';

class TripWidget extends StatelessWidget {
  final Trip trip;
  final bool clickable;

  TripWidget(this.trip, this.clickable);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (clickable) {
            print(
                "Clicked the widget with trip id ${this.trip.tripId}"); // use this to go to the next screen with param trip
            navigateToNextPage(context, trip);
          }
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(MdiIcons.steering),
                      Text("  ${trip.name}  ", style: TextStyle(fontSize: 15)),
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.pin_drop,
                        size: 15.0,
                      ),
                      Text(
                        "  ${trip.destination}",
                        style: TextStyle(fontSize: 15),
                      )
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(MdiIcons.clock),
                      Text(
                        "  ${trip.timestamp}",
                        style: TextStyle(fontSize: 15),
                      )
                    ]),
              ]),
              const SizedBox(width: 40),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RatingBar.readOnly(
                        initialRating: trip.rating,
                        isHalfAllowed: true,
                        halfFilledIcon: Icons.star_half,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        size: 20.0,
                        emptyColor: Colors.amberAccent,
                        filledColor: Colors.amberAccent,
                      ),
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "${trip.passengers}  ",
                        style: TextStyle(fontSize: 15),
                      ),
                      Icon(MdiIcons.carSeat),
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("${trip.luggage}  ", style: TextStyle(fontSize: 15)),
                      Icon(MdiIcons.briefcase)
                    ])
              ])
            ])));
  }

  Future navigateToNextPage(context, trip) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TripPageWidget(trip: trip)));
  }
}
