import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'DriverTrip.dart';
import 'PassengerWidget.dart';

// ignore: must_be_immutable
class DriverTripPageWidget extends StatelessWidget {
  final DriverTrip trip;

  DriverTripPageWidget({this.trip});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("My trip to " + trip.trip.destination),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: CustomScrollView(slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("My Trip", style: TextStyle(fontSize: 30.0))
                      ]),
                  const SizedBox(height: 20),
                  Container(
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(MdiIcons.clock),
                                        Text(
                                          "  ${trip.trip.timestamp}",
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ])
                                ]),
                            const SizedBox(width: 40),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(MdiIcons.carSeat),
                                        Text(
                                            " ${trip.trip.passengers}")
                                      ]),
                                  const SizedBox(height: 10),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(MdiIcons.briefcasePlus),
                                        Text(
                                            " ${trip.trip.luggage}")
                                      ])
                                ])
                          ])),
                  const SizedBox(height: 40),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Requests (${trip.requests.length})",
                            style: TextStyle(fontSize: 30.0))
                      ]),
                  const SizedBox(height: 20),
                  buildListOfPassengers(trip.requests, true, false),
                  const SizedBox(height: 40),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("My Car (${trip.car.length})",
                            style: TextStyle(fontSize: 30.0))
                      ]),
                  const SizedBox(height: 20),
                  buildListOfPassengers(trip.car, false, true),
                  const SizedBox(height: 40),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("PUT THE GOOGLE MAPS THING HERE")
                      ]),
                  Container(
                    height: 400.0,
                    width: 300.0,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 30)
                ]),
              ),
            ])));
  }

  Future navigateToNextPage(context, driverTrips) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DriverTripPageWidget(trip: trip)));
  }

  Widget buildListOfPassengers(List<Passenger> passengers, bool clickable, bool accepted) {
    List<Widget> passengerWidgets = passengers
        .map((passenger) => PassengerWidget(passenger, clickable, accepted))
        .toList();
    return Container(
      child: Column(children: passengerWidgets),
    );
  }
}
