import 'package:drive/main_services.dart';
import 'package:drive/mvvm/foundation/extension/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../loading_screen.dart';
import '../../main.dart';

class DriverDetails extends StatefulHookConsumerWidget {
  const DriverDetails({super.key});

  @override
  ConsumerState createState() => _DriverDetailsState();
}

class _DriverDetailsState extends ConsumerState<DriverDetails> {
  late String name;
  late String phonenum;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController carnumber = TextEditingController();
  TextEditingController license = TextEditingController();

  PhoneNumber number =
      PhoneNumber(countryISOCode: 'IN', number: '91', countryCode: '91');

  @override
  Widget build(BuildContext context) {
    final msClass = ref.watch(msProvider.notifier);
    final isLoading = useState<bool>(false);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: isLoading.value
          ? const LoadingScreen()
          : Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 35, top: 30),
                        child: Text(
                          'Please provide your details',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 33),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 35, right: 35),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      controller: namecontroller,
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Text is empty';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: "Name",
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    IntlPhoneField(
                                      style: TextStyle(color: Colors.black),
                                      controller: numbercontroller,
                                      initialCountryCode: 'IN',
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: "Phone number",
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      controller: carnumber,
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Text is empty';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: "Car number",
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      controller: license,
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Text is empty';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: "License number",
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Let's get started",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor:
                                              const Color(0xff4c505b),
                                          child: IconButton(
                                              color: Colors.black,
                                              onPressed: () {
                                                isLoading.value = true;
                                                Future.delayed(const Duration(
                                                        seconds: 2))
                                                    .then((value) {
                                                  context
                                                      .push(const StateManager(
                                                    driver: true,
                                                  ));
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.arrow_forward,
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
