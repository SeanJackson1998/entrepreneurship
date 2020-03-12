import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_iconic_flutter/open_iconic_flutter.dart';
import 'package:rating_bar/rating_bar.dart';

import 'AcceptRequestPage.dart';
import 'DriverTrip.dart';

class PassengerWidget extends StatelessWidget {
  final Passenger passenger;
  final bool clickable;

  PassengerWidget(this.passenger, this.clickable);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (clickable) {
            print(
                "Clicked the widget with passenger name ${this.passenger.name}"); // use this to go to the next screen with param trip
            navigateToNextPage(context, passenger);
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("${passenger.name}", style: TextStyle(fontSize: 15))
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      RatingBar.readOnly(
                        initialRating: passenger.rating,
                        isHalfAllowed: true,
                        halfFilledIcon: Icons.star_half,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        size: 20.0,
                        emptyColor: Colors.amberAccent,
                        filledColor: Colors.amberAccent,
                      ),
                    ]),
              ]),
              const SizedBox(width: 40),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.pin_drop,
                        size: 15.0,
                      ),
                      Text(" ${passenger.destination}",
                          style: TextStyle(fontSize: 15))
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("${passenger.luggage}  ",
                          style: TextStyle(fontSize: 15)),
                      Icon(
                        OpenIconicIcons.briefcase,
                        size: 15.0,
                      )
                    ])
              ])
            ])));
  }

  Future navigateToNextPage(context, passenger) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AcceptRequestPage(
                  passenger: passenger,
                )));
  }
}
