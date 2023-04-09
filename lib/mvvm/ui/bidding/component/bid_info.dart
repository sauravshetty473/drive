import 'package:drive/mvvm/foundation/extension/context.dart';
import 'package:flutter/material.dart';

import '../../../foundation/app_colors.dart';
import '../../../foundation/app_constants.dart';
import '../../component/svg_helper.dart';
import 'bid.dart';
import 'bid_action.dart';
import 'info.dart';

enum BidInfoAction { info, cancel }

class BidInfo extends StatelessWidget {
  final BidInfoAction bidInfoAction;

  const BidInfo({Key? key, this.bidInfoAction = BidInfoAction.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      decoration: BoxDecoration(
          color: AppColors.PUNK_GREEN,
          borderRadius: BorderRadius.circular(AppConstants.BLUR_RADIUS),
          boxShadow: const [
            BoxShadow(
                blurRadius: 0,
                offset: Offset(0, 16),
                spreadRadius: -8,
                color: AppColors.BLACK_SHADOW)
          ]),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Info(title: 'Trip from', value: 'Mumbai, Maharashtra'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (BidInfoAction.cancel == bidInfoAction)
                        InkWell(
                          onTap: () {},
                          child: const SvgHelper(
                            scale: 2.4,
                            path: 'assets/check_green_icon.svg',
                          ),
                        ),
                      InkWell(
                        onTap: () {
                          switch (bidInfoAction) {
                            case BidInfoAction.info:
                              context.showBottomSheet(
                                  modalSheet: const BidAction(
                                bidFunction: BidFunction.confirm,
                                alter: true,
                              ));
                              break;
                            case BidInfoAction.cancel:
                              context.pop();
                              break;
                          }
                        },
                        child: const SvgHelper(
                          scale: 2.4,
                          path: 'assets/cross_red_icon.svg',
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Info(title: 'Trip to', value: 'Thane, Maharashtra'),
            const Info(
                title: 'Preference',
                value: 'Sedan, 2 seater',
                bottomMargin: false),
          ],
        ),
      ),
    );
    return bidInfoAction == BidInfoAction.cancel
        ? child
        : Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.BOX_PADDING_HORIZONTAL, vertical: 32),
            color: AppColors.CONTAINER_GREY_2,
            child: child,
          );
  }
}
