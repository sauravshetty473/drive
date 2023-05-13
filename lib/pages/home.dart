import 'package:drive/pages/profile.dart';
import 'package:drive/pages/saved_place.dart';
import 'package:flutter/material.dart';

import 'map_location.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Text(
                        'Alex Star',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.black),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()),
                          );
                        },
                        icon: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      "  Where To?",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SavedPlace()),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.black,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          " Choose a saved place",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 5,
                  thickness: 2,
                  color: Colors.grey.withOpacity(0.5),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapLocation()),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_history,
                          color: Colors.black,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          " Set destination on map",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 5,
                  thickness: 2,
                  color: Colors.grey.withOpacity(0.5),
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "assets/map_image.png",
                  height: 360,
                  width: double.infinity,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
