import 'package:drive/pages/safety_alert.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Paste Your Account ID",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.grey.withOpacity(0.3),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  Account ID",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Safety()),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    child: const Text("Next"),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "By continuing you may receive a SMS for verification. Message and data rates may apply.",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black.withOpacity(0.8),
                          thickness: 0.8,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('OK'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black.withOpacity(0.8),
                          thickness: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // Red border with the width is equal to 5
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      )),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  Create new account",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DDrive",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 40,
                      ),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      )),
    );
  }
}
