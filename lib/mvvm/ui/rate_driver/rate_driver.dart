import 'package:drive/mvvm/foundation/app_fonts.dart';
import 'package:drive/mvvm/ui/component/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';

class RateDriver extends HookConsumerWidget {
  const RateDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = useState<int>(0);

    return CustomScaffold(
        title: 'Rate your\nExperience',
        topRightAction: InkWell(
          onTap: () {
            ref.read(pageIndexProvider.notifier).update((state) => 0);
          },
          child: Text(
            'SKIP',
            style: AppFonts.text16Light
                .copyWith(color: Colors.white.withOpacity(0.4)),
          ),
        ),
        bottomRightAction: InkWell(
          onTap: () {
            ref.read(pageIndexProvider.notifier).update((state) => 0);
          },
          child: const Icon(
            Icons.arrow_circle_right,
            size: 60,
          ),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              return InkWell(
                onTap: () {
                  rating.value = index;
                },
                child: index > rating.value
                    ? const Icon(
                        Icons.star_border_rounded,
                        size: 50,
                      )
                    : const Icon(
                        Icons.star_rounded,
                        size: 50,
                      ),
              );
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'Enter some text',
            ),
          )
        ]);
  }
}
