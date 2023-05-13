import 'package:drive/mvvm/foundation/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../mvvm/foundation/app_colors.dart';

final statusProvider = StateProvider<bool>((ref) => true);

class Designation extends StatefulHookConsumerWidget {
  @override
  ConsumerState createState() => _DesignationState();
}

class _DesignationState extends ConsumerState<Designation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Are you a Driver or a Passenger?",
              style: AppFonts.text24Bold.copyWith(color: AppColors.TEXT_COLOR),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade600,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        ref
                            .read(statusProvider.notifier)
                            .update((state) => false);
                        Navigator.pushNamed(context, 'driverdetails');
                      },
                      child: Text("Driver",
                          style: AppFonts.text16Bold
                              .copyWith(color: Colors.white))),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 120,
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade600,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        ref
                            .read(statusProvider.notifier)
                            .update((state) => true);
                        Navigator.pushNamed(context, 'login');
                      },
                      child: Text("Passenger",
                          style: AppFonts.text16Bold
                              .copyWith(color: Colors.white))),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
            const SizedBox(
              height: 100,
            )
          ]),
        ),
      ),
    ));
  }
}
