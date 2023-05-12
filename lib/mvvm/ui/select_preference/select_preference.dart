import 'package:drive/mvvm/foundation/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Vehicle {
  uberX(
      4, 'https://d1a3f4spazzrp4.cloudfront.net/car-types/mono/mono-uberx.png'),
  uberXL(6,
      'https://d1a3f4spazzrp4.cloudfront.net/car-types/mono/mono-uberxl2.png'),
  uberBlack(
      4, 'https://d1a3f4spazzrp4.cloudfront.net/car-types/mono/mono-black.png'),
  uberSUV(
      6, 'https://d1a3f4spazzrp4.cloudfront.net/car-types/mono/mono-suv2.png');

  final int numberOfPeople;
  final String imageURL;

  const Vehicle(this.numberOfPeople, this.imageURL);

  String get titleCaseName {
    String vehicleName = toString().split('.').last;
    List<String> words = vehicleName.split(RegExp('(?=[A-Z])'));
    words[0] = '${words[0][0].toUpperCase()}${words[0].substring(1)}';
    return words.join(' ');
  }
}

class SelectPreference extends HookConsumerWidget {
  const SelectPreference({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              ListTile(
                  title: Text(
                'Choose a destination',
                style: AppFonts.text20SemiBold.copyWith(color: Colors.blue),
              )),
              ...Vehicle.values.map((e) {
                return ListTile(
                  title: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2, color: Colors.black)),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.titleCaseName,
                          style:
                              AppFonts.text24Bold.copyWith(color: Colors.black),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.people,
                              color: Colors.black,
                            ),
                            Text(
                              '.${e.numberOfPeople}',
                              style: AppFonts.text24Bold
                                  .copyWith(color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }).toList()
            ]),
      ),
    );
  }
}
