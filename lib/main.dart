import 'package:drive/pages/map_location.dart';
import 'package:drive/pages/profile.dart';
import 'package:drive/pages/saved_place.dart';
import 'package:drive/pages/wallet.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageView(
        children: const [MapLocation(), Profile(), SavedPlace(), Wallet()],
      ),
    );
  }
}
