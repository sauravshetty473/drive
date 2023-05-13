import 'package:drive/main.dart';
import 'package:drive/mvvm/foundation/app_fonts.dart';
import 'package:drive/mvvm/ui/component/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final index = useState<int>(0);

    return CustomScaffold(
      title: 'Select\nDestination',
      topRightAction: Icon(
        Icons.cancel,
        size: 60,
        color: Colors.white.withOpacity(0.4),
      ),
      bottomRightAction: InkWell(
        onTap: () {
          ref.read(pageIndexProvider.notifier).update((state) => 1);
        },
        child: const Icon(
          Icons.arrow_circle_right,
          size: 60,
        ),
      ),
      children: Destination.values
          .map((e) => Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        width: 2,
                        color: index.value == e.index
                            ? Colors.black.withOpacity(0.2)
                            : Colors.transparent)),
                child: InkWell(
                  onTap: () {
                    index.value = e.index;
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.pin_drop,
                        size: 40,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Text(
                          e.titleCaseName,
                          style: AppFonts.text24SemiBold.copyWith(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text(
                          '${e.distance} km',
                          style: AppFonts.text12Light,
                        ),
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
