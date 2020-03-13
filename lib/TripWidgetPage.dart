import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/PassengerMainPage.dart';
import 'package:flutter_app/TripWidget.dart';

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
      backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text(trip.name + "'s trip to " + trip.destination),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              const SizedBox(height: 50),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [TripWidget(trip, false)])
                  ]),
              const SizedBox(height: 40),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text("PUT THE GOOGLE MAPS THING HERE")]),
              Container(
                height: 300.0,
                width: 300.0,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                          onPressed: () async {
                            await _requestNotify(context);

                            print("UPDATE DRIVER TRIPS FILE WITH THE REQUEST");
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
                            navigateToNextPage(context, driverTrips);
                          },
                        ),
                      ],
                    )
                  ])
            ])));
  }

  Future<void> _requestNotify(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('REQUEST SENT'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your request has been sent.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future navigateToNextPage(context, driverTrips) async {
    updateFile('assets/driver1.json', driverTrips);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PassengerMainPage()));
  }

  void updateFile(String s, driverTrips) async {}
}
