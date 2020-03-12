
import 'package:flutter/material.dart';
import 'package:flutter_app/PassengerMainPage.dart';
import 'package:flutter_app/PassengerWidget.dart';

import 'DriverTrip.dart';

// ignore: must_be_immutable
class AcceptRequestPage extends StatelessWidget {
  final Passenger passenger;

  AcceptRequestPage({this.passenger});


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: AppBar(
          title: Text("Passenger Review Page"),
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
                        children: [PassengerWidget(passenger, false)])
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
                          color: Colors.red,
                          child: Text('REJECT'),
                          onPressed: () {
                            print("UPDATE DRIVER TRIPS FILE WITH THE PASSENGER OUT OF REQUESTS");

                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        RaisedButton(
                          color: Color(0XFF2699FB),
                          textColor: Colors.white,
                          child: Text('ACCEPT'),
                          onPressed: () async {
                            await _requestNotify(context, passenger.name);

                            print("UPDATE DRIVER TRIPS FILE WITH THE PASSENGER INTO THE CAR OUT OF REQUESTS");
                            // Update the file with the object from request to the car

                            Navigator.of(context).pop();
                       },
                        ),
                      ],
                    )
                  ])
            ])));
  }

  Future<void> _requestNotify(context, passenger) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('REQUEST ACCEPTED'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You have accepted $passenger into your car.'),
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

  Future navigateToNextPage(context) async {

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PassengerMainPage()));
  }

  void updateFile(String s, driverTrips) async {}
}
