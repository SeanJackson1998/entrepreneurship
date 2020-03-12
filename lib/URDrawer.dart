import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'DriverMainPage.dart';
import 'PassengerMainPage.dart';

class URDrawer extends Drawer {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Aidan Saxon"),
            accountEmail: Text("adian.saxon@bath.ac.uk"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text("Driver"),
            trailing: Icon(MdiIcons.steering),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DriverMainPage()));
            },
          ),
          ListTile(
            title: Text("Passenger"),
            trailing: Icon(MdiIcons.seatPassenger),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PassengerMainPage()));
            },
          ),
        ],
      ),
    );
  }
}
