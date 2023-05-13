import 'package:drive/main_services.dart';
import 'package:drive/mvvm/ui/component/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../main.dart';
import '../bidding/component/bid.dart';

final tickerProvider =
    StreamProvider.autoDispose.family<int, int>((ref, duration) {
  return Stream<int>.periodic(
    Duration(milliseconds: duration),
    (int count) => count,
  );
});

class Offer extends HookConsumerWidget {
  const Offer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tickerProvider(5000));
    final msClass = ref.watch(msProvider);

    return CustomScaffold(
      title: 'Listening for\nOffers',
      topRightAction: InkWell(
        onTap: () {
          ref.read(pageIndexProvider.notifier).update((state) => 0);
        },
        child: Icon(
          Icons.cancel,
          size: 60,
          color: Colors.white.withOpacity(0.4),
        ),
      ),
      children: [
        FutureBuilder(

          future: msClass.getActiveRequests(),
          builder: (ctx, snapshot) {
            if (snapshot.data != null) {
              return const Bid();
            }
            return const SizedBox();
          },
        ),
        Lottie.asset('assets/search_uber.json')
      ],
    );
  }
}
