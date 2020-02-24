import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class Trip {
  int id;
  String name;
  String destination;
  int timestamp;
  int rating;
  int passenger;
  int luggage;

  Trip(
      {this.id,
      this.name,
      this.destination,
      this.timestamp,
      this.rating,
      this.passenger,
      this.luggage});

  factory Trip.fromJson(Map<String, dynamic> parsedJson) {
    return Trip(
        id: parsedJson['id'],
        name: parsedJson['name'],
        destination: parsedJson['destination'],
        timestamp: parsedJson['timestamp'],
        rating: parsedJson['rating'],
        passenger: parsedJson['passenger'],
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
    print(widget.trips);



    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Load Json'),
          ),
          body: new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Row(
                children: <Widget>[
                  Text(
                      "${widget.trips.map((el) => "id ${el.id} name ${el.name}")}")  // make this show the whole record and then load for multiple
                ],
              ))),
    );
  }
}
