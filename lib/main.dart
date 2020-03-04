import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'Trip.dart';
import 'TripWidget.dart';

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

    return new MaterialApp(
        home: new Scaffold(
      appBar: AppBar(
        title: Text("TripListView"),
      ),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(tripWidgets),
            ),
          ],
        ),
      ),
    ));
  }

  List<Widget> buildTripContainers(List<Trip> trips) {
    List<Widget> tripWidgets = [];
    trips.forEach(
        (trip) => tripWidgets.addAll([TripWidget(trip), SizedBox(height: 2)]));
    print(tripWidgets);
    return tripWidgets;
  }
}