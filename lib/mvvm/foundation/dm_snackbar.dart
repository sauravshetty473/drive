import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

enum DmSnackBarType { info, success, warning, error, black }

showDmSnackBar(BuildContext context, DmSnackBarType type, String content) =>
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        _dmSnackBar(type, content),
      );

SnackBar _dmSnackBar(DmSnackBarType type, String content) {
  late Color color;

  switch (type) {
    case DmSnackBarType.info:
      color = AppColors.BLACK;
      break;
    case DmSnackBarType.warning:
      color = AppColors.PUNK_GREEN;
      break;
    case DmSnackBarType.success:
      color = AppColors.PUNK_GREEN;
      break;
    case DmSnackBarType.error:
      color = AppColors.PUNK_GREEN;
      break;
    case DmSnackBarType.black:
      color = AppColors.PUNK_GREEN;
      break;
    default:
  }

  return SnackBar(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    backgroundColor: color,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(
            content,
            style: AppFonts.text12Bold,
          ),
        ),
        Builder(builder: (context) {
          return Transform.translate(
            offset: const Offset(5, 0),
            child: InkWell(
              splashColor: Colors.white.withOpacity(0.4),
              onTap: ([mounted = true]) async {
                await Future.delayed(const Duration(milliseconds: 150));
                if (mounted) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }),
      ],
    ),
    duration: const Duration(milliseconds: 2000),
  );
}
