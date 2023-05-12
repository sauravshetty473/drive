import 'package:drive/mvvm/foundation/app_fonts.dart';
import 'package:drive/mvvm/ui/component/custom_scaffold.dart';
import 'package:flutter/material.dart';

class ConfirmedRide extends StatelessWidget {
  const ConfirmedRide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Ride\nInitiated',
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.lightGreen),
          width: double.infinity,
          height: 100,
          child: Center(
            child: Text(
              'PAY',
              style: AppFonts.text24Bold,
            ),
          ),
        )
      ],
    );
  }
}
