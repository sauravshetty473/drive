import 'package:drive/main.dart';
import 'package:drive/mvvm/foundation/app_fonts.dart';
import 'package:drive/mvvm/foundation/extension/context.dart';
import 'package:drive/mvvm/ui/component/custom_scaffold.dart';
import 'package:drive/services/payment_services.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmedRide extends HookConsumerWidget {
  final bool isDriver;
  const ConfirmedRide({Key? key, this.isDriver = false}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      title: 'Ride\nInitiated',
      children: isDriver
          ? []
          : [
              InkWell(
                onTap: () {
                  context.push(const UpiPayment());
                  ref
                      .read(pageIndexProvider.notifier)
                      .update((state) => state + 1);
                },
                child: Container(
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
                ),
              )
            ],
    );
  }
}
