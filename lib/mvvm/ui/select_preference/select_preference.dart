import 'package:drive/mvvm/foundation/app_fonts.dart';
import 'package:drive/mvvm/ui/component/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../loading_screen.dart';
import '../../../main.dart';
import '../../../main_services.dart';

enum Vehicle {
  driveX(4,
      'https://d1a3f4spazzrp4.cloudfront.net/car-types/mono/mono-drivex.png'),
  driveXL(6,
      'https://d1a3f4spazzrp4.cloudfront.net/car-types/mono/mono-drivexl2.png'),
  driveBlack(
      4, 'https://d1a3f4spazzrp4.cloudfront.net/car-types/mono/mono-black.png'),
  driveSUV(
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
    final msClass = ref.watch(msProvider.notifier);
    final isLoading = useState<bool>(false);

    final index = useState<int>(0);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: isLoading.value
          ? const LoadingScreen()
          : CustomScaffold(
              title: 'Choose\nPreference',
              topRightAction: InkWell(
                onTap: () {
                  ref.read(pageIndexProvider.notifier).update((state) => 2);
                },
                child: Text(
                  'SKIP',
                  style: AppFonts.text16Light
                      .copyWith(color: Colors.white.withOpacity(0.4)),
                ),
              ),
              bottomRightAction: InkWell(
                onTap: () {
                  isLoading.value = true;
                  Future.delayed(const Duration(seconds: 2)).then((value) {
                    ref.read(pageIndexProvider.notifier).update((state) => 2);
                  });
                },
                child: const Icon(
                  Icons.arrow_circle_right,
                  size: 60,
                ),
              ),
              children: Vehicle.values.map((e) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 2,
                          color: e.index == index.value
                              ? Colors.black
                              : Colors.white)),
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      index.value = e.index;
                    },
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
                              ' ${e.numberOfPeople}',
                              style: AppFonts.text24Bold
                                  .copyWith(color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
