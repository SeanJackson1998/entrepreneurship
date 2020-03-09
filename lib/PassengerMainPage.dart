import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Trip.dart';
import 'TripWidget.dart';
import 'URDrawer.dart';

Future<String> load() async {
  return await rootBundle.loadString('assets/trips.json');
}

Future<List<Trip>> loadTrips() async {
  String jsonString = await load();
  List<dynamic> jsonArray = json.decode(jsonString);
  List<Trip> trips = jsonArray.map((el) => new Trip.fromJson(el)).toList();
  return trips;
}

class PassengerMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PassengerMainPageState();
}

// ignore: must_be_immutable
class _PassengerMainPageState extends State<PassengerMainPage> {
  List<Trip> trips = [];

  void fetchData() async {
    var data = await loadTrips();
    setState(() {
      trips = data;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  List<Widget> buildTripContainers(List<Trip> trips) {
    return trips.map((trip) => TripWidget(trip)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("TripListView"),
      ),
      drawer: URDrawer(),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate:
                  SliverChildListDelegate(buildTripContainers(this.trips)),
            ),
          ],
        ),
      ),
    );
  }
}
