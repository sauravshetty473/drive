import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alex Star',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey.withOpacity(0.3)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '5.0',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.black),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      [Icons.help, 'Help'],
                      [Icons.wallet, 'Wallet'],
                      [Icons.trip_origin, 'Trip']
                    ]
                        .map(
                          (List e) => Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.withOpacity(0.3)),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(e[0]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(e[1])
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList()),
                const Divider(
                  height: 40,
                  thickness: 10,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                ...[
                  [Icons.help, 'Help'],
                  [Icons.wallet, 'Wallet'],
                  [Icons.trip_origin, 'Trip']
                ]
                    .map((List e) => Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Icon(e[0]),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(e[1])
                            ],
                          ),
                        ))
                    .toList(),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'v1.0.1',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
