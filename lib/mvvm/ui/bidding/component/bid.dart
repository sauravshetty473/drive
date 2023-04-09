import 'package:drive/mvvm/foundation/extension/context.dart';
import 'package:drive/mvvm/ui/bidding/component/bid_action.dart';
import 'package:flutter/material.dart';

import '../../../foundation/app_colors.dart';
import '../../../foundation/app_constants.dart';
import '../../component/svg_helper.dart';
import 'info.dart';

enum BidFunction { select, cancel, confirm }

class Bid extends StatelessWidget {
  final BidFunction bidFunction;

  const Bid({Key? key, this.bidFunction = BidFunction.select})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(
          bottom: AppConstants.BOX_PADDING_HORIZONTAL * 2),
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      decoration: BoxDecoration(
          color: AppColors.CONTAINER_GREY_2,
          borderRadius: BorderRadius.circular(AppConstants.BLUR_RADIUS),
          boxShadow: const [
            BoxShadow(
                blurRadius: 0,
                offset: Offset(0, 16),
                spreadRadius: -8,
                color: AppColors.BLACK_SHADOW)
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Info(title: 'Fair', value: '₹400'),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        switch (bidFunction) {
                          case BidFunction.select:
                            context.showBottomSheet(
                                modalSheet: const BidAction(
                              bidFunction: BidFunction.confirm,
                            ));
                            break;
                          case BidFunction.cancel:
                            // TODO: Handle this case.
                            break;
                          case BidFunction.confirm:
                            // TODO: Handle this case.
                            break;
                        }
                      },
                      child: const SvgHelper(
                        scale: 2,
                        path: 'assets/check_green_icon.svg',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        switch (bidFunction) {
                          case BidFunction.select:
                            context.showBottomSheet(
                                modalSheet: const BidAction(
                              bidFunction: BidFunction.cancel,
                            ));
                            break;
                          case BidFunction.cancel:
                          case BidFunction.confirm:
                            context.pop();
                            break;
                        }
                      },
                      child: const SvgHelper(
                        scale: 2,
                        path: 'assets/cross_red_icon.svg',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Expanded(
                child: Info(title: 'Vehicle', value: 'Auto'),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 80,
                  child: SvgHelper(
                    path: 'assets/car.svg',
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(
                  child: Info(
                title: 'Rating',
                value: '4.7',
                bottomMargin: false,
              )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Row(
                children: List.generate(5, (index) {
                  if (index == 4) {
                    return const Icon(Icons.star_half_rounded);
                  }
                  return const Icon(Icons.star_rounded);
                }),
              ))
            ],
          )
        ],
      ),
    );
  }
}
