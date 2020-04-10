import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DriverMainPage.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'URDrawer.dart';

class AddTripPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddTripPageState();
}

// ignore: must_be_immutable
class _AddTripPageState extends State<AddTripPage> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    DriverMainPage(),
    AddTripPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => _children[index]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
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
            child: Column(children: [
              const SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          labelText: "Start Location",
                          hintText: "Start Location",
                          prefixIcon: Icon(
                            Icons.pin_drop,
                            size: 15.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ))
                  ]),
              const SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          labelText: "Destination",
                          hintText: "Destination",
                          prefixIcon: Icon(
                            Icons.pin_drop,
                            size: 15.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ))
                  ]),
              const SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Date and time of Departure"),
                    FlatButton(
                        onPressed: () {
                          DatePicker.showDateTimePicker(context,
                              showTitleActions: true, onChanged: (date) {
                            print('change $date in time zone ' +
                                date.timeZoneOffset.inHours.toString());
                          }, onConfirm: (date) {
                            print('confirm $date');
                          }, currentTime: DateTime.now());
                        },
                        child: Text(
                          'show time picker',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ]),
              const SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          labelText: "Spare Seats",
                          hintText: "Spare Seats",
                          prefixIcon: Icon(MdiIcons.carSeat),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ))
                  ]),
              const SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          labelText: "Number of Suitcases",
                          hintText: "Number of Suitcases",
                          prefixIcon: Icon(MdiIcons.briefcase),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ))
                  ]),
              const SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          labelText: "Price",
                          hintText: "£",
                          prefixIcon: Icon(MdiIcons.pound),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ))
                  ]),
              const SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Color(0XFF2699FB),
                      textColor: Colors.white,
                      child: Text('SUBMIT'),
                      onPressed: () async {
                        await _requestNotify(context);
                        navigateToNextPage(context);
                      },
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
          title: Text('TRIP LOGGED'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your trip has been logged.'),
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
        context, MaterialPageRoute(builder: (context) => DriverMainPage()));
  }
}
