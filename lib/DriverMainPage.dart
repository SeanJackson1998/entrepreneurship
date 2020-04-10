import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/DriverTrip.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'DriverTripWidget.dart';
import 'AddTripPage.dart';
import 'URDrawer.dart';

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

class DriverMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DriverMainPageState();
}

// ignore: must_be_immutable
class _DriverMainPageState extends State<DriverMainPage> {
  List<DriverTrip> trips = [];
  int _currentIndex = 0;
  final List<Widget> _children = [
    DriverMainPage(),
    AddTripPage(),
    ];
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

  List<Widget> buildTripContainers(List<DriverTrip> trips) {
    return trips.map((trip) => DriverTripWidget(trip)).toList();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => _children[index]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("My Trips"),
      ),
      drawer: URDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.car),
            title: Text('My Trips'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.plusBox),
            title: Text('Add a Trip'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.bell),
            title: Text('Notifications'),
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onTabTapped,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
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
