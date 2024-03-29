import 'package:drive/main_services.dart';
import 'package:drive/mvvm/ui/confirmed_ride/confirmed_ride.dart';
import 'package:drive/mvvm/ui/offer/offer.dart';
import 'package:drive/mvvm/ui/offer/offer_driver.dart';
import 'package:drive/mvvm/ui/put_price/put_price.dart';
import 'package:drive/mvvm/ui/rate_driver/rate_driver.dart';
import 'package:drive/mvvm/ui/select_destination/select_destination.dart';
import 'package:drive/mvvm/ui/select_preference/select_preference.dart';
import 'package:drive/pages/Login/driverdetails.dart';
import 'package:drive/pages/Login/login.dart';
import 'package:drive/pages/Login/userdetails.dart';
import 'package:drive/pages/home.dart';
import 'package:drive/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scaled_app/scaled_app.dart';

import 'mvvm/foundation/app_constants.dart';

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

final pageIndexProvider = StateProvider.autoDispose((ref) => 0);

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(msProvider);
    final index = ref.watch(pageIndexProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'login': (context) => const Login(),
        'userdetails': (context) => UserDetails(),
        'home': (context) => Home(),
        'driverdetails': (context) => DriverDetails(),
      },
      home: const SplashScreen(),
    );
  }
}

class StateManager extends HookConsumerWidget {
  final bool driver;
  const StateManager({this.driver = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(pageIndexProvider);
    return driver
        ? const [
            OfferDriver(),
            PutPrice(),
            ConfirmedRide(
              isDriver: true,
            ),
            RateDriver(),
          ][index]
        : const [
            SelectDestination(),
            SelectPreference(),
            Offer(),
            ConfirmedRide(),
            RateDriver(),
          ][index];
  }
}
