import 'package:drive/mvvm/foundation/app_fonts.dart';
import 'package:drive/mvvm/ui/bidding/component/bid.dart';
import 'package:drive/mvvm/ui/component/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';

class PutPrice extends HookConsumerWidget {
  const PutPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      topWidget: Align(
        alignment: Alignment.bottomCenter,
        child: TextField(
          style:
              AppFonts.text24Bold.copyWith(color: Colors.white.withOpacity(1)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: '00',
              hintStyle: AppFonts.text24Bold
                  .copyWith(color: Colors.white.withOpacity(0.4))),
        ),
      ),
      topRightAction: Icon(
        Icons.cancel,
        size: 60,
        color: Colors.white.withOpacity(0.4),
      ),
      bottomRightAction: InkWell(
        onTap: () {
          ref.read(pageIndexProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(
          Icons.arrow_circle_right,
          size: 60,
        ),
      ),
      children: const [Bid()],
    );
  }
}
