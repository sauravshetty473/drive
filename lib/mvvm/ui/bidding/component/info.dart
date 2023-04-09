import 'package:flutter/material.dart';

import '../../../foundation/app_colors.dart';
import '../../../foundation/app_fonts.dart';

class Info extends StatelessWidget {
  final String title;
  final String value;
  final bool bottomMargin;

  const Info(
      {Key? key,
      required this.title,
      required this.value,
      this.bottomMargin = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin ? 12 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppFonts.text20SemiBold
                .copyWith(color: AppColors.TRANS_TEXT_BLACK),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: double.infinity,
            color: AppColors.WHITE.withOpacity(0.4),
            padding: const EdgeInsets.all(4),
            child: Text(
              value,
              style: AppFonts.text12.copyWith(color: AppColors.TEXT_COLOR),
            ),
          )
        ],
      ),
    );
  }
}
