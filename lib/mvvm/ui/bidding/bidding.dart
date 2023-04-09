import 'package:drive/mvvm/foundation/app_colors.dart';
import 'package:drive/mvvm/foundation/app_constants.dart';
import 'package:drive/mvvm/ui/bidding/component/bid.dart';
import 'package:drive/mvvm/ui/bidding/component/bid_info.dart';
import 'package:drive/mvvm/ui/component/dm_scaffold.dart';
import 'package:flutter/material.dart';

class Bidding extends StatelessWidget {
  const Bidding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DmScaffold(
      backgroundColor: AppColors.WHITE,
      title: 'Bidding',
      body: Padding(
          padding: const EdgeInsets.all(AppConstants.BOX_PADDING_HORIZONTAL),
          child: Column(
            children: List.generate(4, (index) => const Bid()),
          )),
      child: const BidInfo(),
    );
  }
}
