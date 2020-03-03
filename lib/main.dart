import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class Trip {
  int tripId;
  int driverId;
  String name;
  String destination;
  int timestamp;
  double rating;
  int passengers;
  int luggage;

  Trip(
      {this.tripId,
        this.driverId,
      this.name,
      this.destination,
      this.timestamp,
      this.rating,
      this.passengers,
      this.luggage});

  factory Trip.fromJson(Map<String, dynamic> parsedJson) {
    return Trip(
        tripId: parsedJson['tripId'],
        driverId: parsedJson['driverId'],
        name: parsedJson['name'],
        destination: parsedJson['destination'],
        timestamp: parsedJson['timestamp'],
        rating: parsedJson['rating'],
        passengers: parsedJson['passengers'],
        luggage: parsedJson['luggage']);
  }
}

Future<String> load() async {
  return await rootBundle.loadString('assets/trips.json');
}

Future<List<Trip>> loadTrips() async {
  String jsonString = await load();
  List<dynamic> jsonArray = json.decode(jsonString);
  List<Trip> trips = jsonArray.map((el) => new Trip.fromJson(el)).toList();
  return trips;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<Trip> trips = await loadTrips();
  runApp(MyApp(trips: trips));
}

class MyApp extends StatefulWidget {
  final List<Trip> trips;

  MyApp({this.trips});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tripWidgets = buildTripContainers(widget.trips);

//    return new MaterialApp(
//      home: new Scaffold(
//          appBar: new AppBar(
//            title: new Text('Load Json'),
//          ),
//          body: new Container(padding: new EdgeInsets.all(20.0), child: trips)),
//    );

    return new MaterialApp(
        home: new Scaffold(
      appBar: AppBar(
        title: Text("TripListView"),
      ),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                  tripWidgets
                ,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  List<Widget> buildTripContainers(List<Trip> trips) {
    List<Widget> tripWidgets = [];
    trips.forEach((trip) => tripWidgets.addAll([TripWidget(trip), SizedBox(height: 2)]));
    print(tripWidgets);
    return tripWidgets;
  }
}

class TripWidget extends StatelessWidget {
  final Trip trip;

  TripWidget(this.trip);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("Clicked the widget with trip id ${this.trip.tripId}"); // use this to go to the next screen with param trip
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
}
