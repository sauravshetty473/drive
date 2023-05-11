import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class locationPick extends StatefulWidget {
  @override
  _locationPickState createState() => _locationPickState();
}

class _locationPickState extends State<locationPick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: OpenStreetMapSearchAndPick(
              center: LatLong(19.07, 72.9),
              buttonColor: Colors.blue,
              buttonText: 'Set Current Location',
              onPicked: (pickedData) {})),
    );
  }
}
