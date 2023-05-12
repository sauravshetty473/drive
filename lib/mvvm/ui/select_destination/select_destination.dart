import 'package:drive/mvvm/foundation/app_colors.dart';
import 'package:drive/mvvm/foundation/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Destination {
  ghatkopar(10),
  bhandup(15),
  kanjurmarg(20),
  vikroli(25),
  mumbai(30);

  final int distance;

  const Destination(this.distance);

  String get titleCaseName {
    String destinationName = toString().split('.').last;
    List<String> words = destinationName.split(RegExp('(?=[A-Z])'));
    words[0] = '${words[0][0].toUpperCase()}${words[0].substring(1)}';
    return words.join(' ');
  }
}

class SelectDestination extends HookConsumerWidget {
  const SelectDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.DOCTOR_BLUE,
      body: Center(
        child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              ListTile(
                  title: Text(
                'Choose a destination',
                style: AppFonts.text16Light.copyWith(color: Colors.blue),
              )),
              ...Destination.values.map((e) {
                return ListTile(
                  title: Text(
                    e.titleCaseName,
                    style: AppFonts.text20SemiBold,
                  ),
                  subtitle: Text(
                    'distance ${e.distance}',
                    style: AppFonts.text12Light
                  ),
                );
              }).toList()
            ]),
      ),
    );
  }
}
