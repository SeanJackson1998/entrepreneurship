import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'URDrawer.dart';

class DriverHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("DRIVER PAGE"),
        ),
        drawer: URDrawer(),
        body: Container(child: Text('YOU BIG DOSSER')));
  }
}
