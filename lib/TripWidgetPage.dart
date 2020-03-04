import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'DriverTrip.dart';
import 'Trip.dart';

Future<String> load() async {
  return await rootBundle.loadString('assets/driver1.json');
}

Future<List<DriverTrip>> loadTrips() async {
  String jsonString = await load();
  List<dynamic> jsonArray = json.decode(jsonString);
  List<DriverTrip> trips =
      jsonArray.map((el) => new DriverTrip.fromJson(el)).toList();
  return trips;
}

// ignore: must_be_immutable
class TripPageWidget extends StatelessWidget {
  final Trip trip;
  List<DriverTrip> driverTrips;

  TripPageWidget({this.trip});

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    this.driverTrips = await loadTrips();
  }

  @override
  Widget build(BuildContext context) {
    main();

    Passenger sean = Passenger.fromJson({
      "name": "Sean Jackson",
      "destination": "Bristol",
      "rating": 4.5,
      "luggage": 0
    });

    return new Scaffold(
        appBar: AppBar(
          title: Text(trip.name + "'s trip to " + trip.destination),
        ),
        body: Container(
            child: Column(children: [
          const SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[Text("Driver Name: ${trip.name}")]),
              const SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[Text("Destination: ${trip.destination}")]),
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
          ]),
          const SizedBox(height: 40),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("PUT THE GOOGLE MAPS THING HERE")]),
          Container(
            height: 400.0,
            width: 300.0,
            color: Colors.blueAccent,
          ),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: Text('PREVIOUS'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  color: Color(0XFF2699FB),
                  textColor: Colors.white,
                  child: Text('REQUEST'),
                  onPressed: () {
                    print(driverTrips);
                    // send a request to the driver file and add to the request section of that trip.
                    // search for which trip was passed through
                    int seanstrip = 0;
                    for (int i = 0; i < driverTrips.length; i++) {
                      if (driverTrips[i].trip.tripId == trip.tripId) {
                        seanstrip = i;
                        driverTrips[i].requests.add(sean);
                      }
                    }
                    print(driverTrips[seanstrip].requests);
                    // write this object back to the file for driver1.json to complete request
                  },
                ),
              ],
            )
          ])
        ])));
  }
}
