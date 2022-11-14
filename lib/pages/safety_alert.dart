import 'package:drive/pages/home.dart';
import 'package:flutter/material.dart';

class Safety extends StatefulWidget {
  const Safety({super.key});

  @override
  State<Safety> createState() => _SafetyState();
}

class _SafetyState extends State<Safety> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ddrive's community guidelines",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Safety and Respect for all",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We are committed, along with millions of riders and drivers to -",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.check),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Treat everyone with kindness and respect.",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.check),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Help keep one another safe.",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.check),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Follow the law.",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Everyone who uses Ddrive is expected to follow these guidelines.",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "You can read about our ",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Community's guidelines here",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.blue.withOpacity(0.8),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  child: const Text("I understand"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
