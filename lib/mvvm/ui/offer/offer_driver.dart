import 'package:drive/mvvm/ui/component/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../bidding/component/bid.dart';


class OfferDriver extends HookConsumerWidget {
  const OfferDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      title: 'Listening for\nRequests',
      topRightAction: Icon(
        Icons.cancel,
        size: 60,
        color: Colors.white.withOpacity(0.4),
      ),
      children: [
        ...List.generate(1, (index) => const Bid()),
        Lottie.asset('assets/search_uber.json')
      ],
    );
  }
}
