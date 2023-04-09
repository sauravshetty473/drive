import 'package:drive/mvvm/ui/bidding/component/bid.dart';
import 'package:drive/mvvm/ui/bidding/component/bid_info.dart';
import 'package:flutter/material.dart';

import '../../../foundation/app_colors.dart';
import '../../../foundation/app_constants.dart';
import '../../../foundation/app_fonts.dart';

class BidAction extends StatelessWidget {
  final BidFunction bidFunction;
  final bool alter;

  const BidAction({Key? key, required this.bidFunction, this.alter = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.WHITE,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppConstants.BLUR_RADIUS),
              topRight: Radius.circular(AppConstants.BLUR_RADIUS))),
      child: Column(
        children: [
          alter
              ? const BidInfo(bidInfoAction: BidInfoAction.cancel)
              : Bid(
                  bidFunction: bidFunction,
                ),
          const SizedBox(
            height: 40,
          ),
          Text(
            alter
                ? 'Cancel Bidding?'
                : (bidFunction == BidFunction.confirm
                    ? 'Confirm Ride?'
                    : 'Reject Offer?'),
            style: AppFonts.text24Bold.copyWith(color: AppColors.TEXT_COLOR),
          )
        ],
      ),
    );
  }
}
