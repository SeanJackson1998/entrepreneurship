import 'package:flutter/material.dart';

import 'PassengerMainPage.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'UniRide', home: PassengerMainPage());
  }
}
