import 'package:drive/mvvm/foundation/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomScaffold extends StatelessWidget {
  final String? title;
  final Widget? topWidget;
  final List<Widget>? children;
  final Widget? topRightAction;
  final Widget? bottomRightAction;

  const CustomScaffold(
      {Key? key,
      this.title,
      this.topWidget,
      this.children,
      this.topRightAction,
      this.bottomRightAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.all(AppConstants.BOX_PADDING_HORIZONTAL),
              height: 250,
              width: double.infinity,
              color: Colors.black,
              child: Stack(
                children: [
                  topWidget ?? const SizedBox(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title ?? '',
                      style: GoogleFonts.lexend(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                          color: Colors.white.withOpacity(0.4)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: topRightAction ?? const SizedBox(),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.all(AppConstants.BOX_PADDING_HORIZONTAL),
                  child: Column(
                    children: children ?? [],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: bottomRightAction,
    );
  }
}
