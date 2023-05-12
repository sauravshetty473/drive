import 'package:drive/pages/login.dart';

import 'package:drive/pages/splash_screen.dart';
import 'package:drive/services/payment_services.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scaled_app/scaled_app.dart';

import 'mvvm/foundation/app_constants.dart';
import 'mvvm/ui/select_preference/select_preference.dart';

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
      routes: {
        'login': (context) => Login(),
      },
      home: SplashScreen(),
    );
  }
}
