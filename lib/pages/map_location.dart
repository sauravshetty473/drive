import 'package:drive/pages/search_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLocation extends StatelessWidget {
  const MapLocation({Key? key}) : super(key: key);
  static const LatLng source = LatLng(19.2312, 73.0891);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Center(
              child: Text(
                'Alex',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: Image.network(
              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          const GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: source, zoom: 14.5)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Enter your destination',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Tell us where you want to go',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 20,
                            color: Colors.blue,
                          ),
                          Container(
                            width: 1,
                            height: 20,
                            color: Colors.white,
                          ),
                          const Icon(
                            Icons.pin_drop,
                            size: 20,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Mumbai, Maharashtra, India',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Divider(
                            height: 20,
                            thickness: 2,
                            color: Colors.black.withOpacity(0.9),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchPlacesScreen()),
                              );
                            },
                            child: Text(
                              'Enter your destination',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.9),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.indigo,
                  ),
                  child: Stack(
                    children: const [
                      Center(
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
