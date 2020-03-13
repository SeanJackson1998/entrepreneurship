import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:open_iconic_flutter/open_iconic_flutter.dart';

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
  List<Trip> items = [];
  int _selectedIndex = 0;

  TextEditingController editingController = TextEditingController();

  void fetchData() async {
    var data = await loadTrips();
    setState(() {
      trips = data;
    });
    items.addAll(trips);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  List<Widget> buildTripContainers(List<Trip> trips) {
    print(trips.length);
    trips = trips
        .where((trip) => trip.driverId != 1)
        .toList(); // COMMENT THIS LINE WHEN WE WANT TO SHOW ALL AVAILABLE TRIPS
    return trips.map((trip) => TripWidget(trip, true)).toList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Available Trips"),
        ),
        drawer: URDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(OpenIconicIcons.envelopeClosed, size: 20),
              title: Text('Requests'),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.car),
              title: Text('Trips'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(children: [
//            const SizedBox(height: 10),
            Row(children: [
              Expanded(
                  child: TextField(
                onChanged: (value) {
                  print(value);
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ))
            ]),
//            const SizedBox(height: 10),
            Column(children: buildTripContainers(items))
          ]),
        ));
  }

  void filterSearchResults(String query) {
    List<Trip> allTrips = List<Trip>();
    allTrips.addAll(this.trips);
    print(allTrips.length);
    if (query.isNotEmpty) {
      List<Trip> searchTrips = List<Trip>();
      allTrips.forEach((item) {
        if (item.destination.toLowerCase().contains(query.toLowerCase())) {
          searchTrips.add(item);
          print(item.destination);
        }
      });
      print(searchTrips.length);
      print("=======================================");
      setState(() {
        items.clear();
        items.addAll(searchTrips);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(this.trips);
      });
    }
  }
}
