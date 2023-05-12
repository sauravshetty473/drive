import 'package:drive/main_services.dart';
import 'package:drive/pages/Login/designation.dart';
import 'package:drive/pages/Login/login.dart';
import 'package:drive/pages/Login/userdetails.dart';
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

final pageIndexProvider = StateProvider((ref) => 0);

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final ms = MainServices();
    final index = ref.watch(pageIndexProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'login': (context) => const Login(),
        'userdetails': (context) => UserDetails(),
      },
      home: Designation(),
    );
  }
}
