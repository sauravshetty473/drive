import 'package:drive/mvvm/ui/confirmed_ride/confirmed_ride.dart';
import 'package:drive/mvvm/ui/offer/offer.dart';
import 'package:drive/mvvm/ui/put_price/put_price.dart';
import 'package:drive/mvvm/ui/rate_driver/rate_driver.dart';
import 'package:drive/mvvm/ui/select_destination/select_destination.dart';
import 'package:drive/mvvm/ui/select_preference/select_preference.dart';
import 'package:drive/pages/login.dart';
import 'package:drive/pages/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scaled_app/scaled_app.dart';

import 'mvvm/foundation/app_constants.dart';
import 'mvvm/ui/offer/offer_driver.dart';

void main() {
  Paint.enableDithering = true;
  ScaledWidgetsFlutterBinding.ensureInitialized(
    scaleFactor: (deviceSize) {
      if (deviceSize.width > deviceSize.height) {
        return deviceSize.height / 667;
      }
      return deviceSize.width / AppConstants.BOX_WIDTH;
    },
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final pageIndexProvider = StateProvider((ref) => 0);

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(pageIndexProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'login': (context) => Login(),
        'verify': (context) => MyVerify(),
      },
      home: const [
        SelectDestination(),
        SelectPreference(),
        Offer(),
        ConfirmedRide(),
        RateDriver(),
        OfferDriver(),
        PutPrice(),
      ][index],
    );
  }
}
