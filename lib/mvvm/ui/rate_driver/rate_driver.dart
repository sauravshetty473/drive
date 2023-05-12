import 'package:drive/mvvm/foundation/app_fonts.dart';
import 'package:drive/mvvm/ui/component/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RateDriver extends HookConsumerWidget {
  const RateDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
        title: 'Rate your\nExperience',
        topRightAction: InkWell(
          onTap: () {},
          child: Text(
            'SKIP',
            style: AppFonts.text16Light
                .copyWith(color: Colors.white.withOpacity(0.4)),
          ),
        ),
        bottomRightAction: const Icon(
          Icons.arrow_circle_right,
          size: 60,
        ),
        children: [
          Row(
            children: List.generate(5, (index) {
              if (index == 4) {
                return const Icon(Icons.star_half_rounded);
              }
              return const Icon(Icons.star_rounded);
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
