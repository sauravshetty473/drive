import 'package:drive/mvvm/foundation/extension/context.dart';
import 'package:flutter/material.dart';

import '../../foundation/app_colors.dart';
import '../../foundation/app_constants.dart';
import '../../foundation/app_fonts.dart';
import 'svg_helper.dart';

class DmScaffold extends StatelessWidget {
  final String? title;
  final Widget? child;
  final Widget? body;
  final Widget? bottomBar;
  final Widget? leading;
  final bool isScrollable;
  final List<Widget>? actions;
  final VoidCallback? leadingAction;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final bool isAppBarTransparent;
  final bool resizeToAvoidBottomInset;

  const DmScaffold({
    required this.title,
    this.child,
    this.isAppBarTransparent = false,
    this.leadingAction,
    this.backgroundColor,
    this.leading,
    this.scrollController,
    this.scrollPhysics,
    this.body,
    this.bottomBar,
    this.isScrollable = true,
    this.resizeToAvoidBottomInset = true,
    this.actions,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: backgroundColor ?? AppColors.HOME_BG,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: kToolbarHeight,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.BOX_PADDING_HORIZONTAL,
                          ),
                          decoration: BoxDecoration(
                            color: isAppBarTransparent ? null : AppColors.WHITE,
                            boxShadow: isAppBarTransparent
                                ? null
                                : [
                                    BoxShadow(
                                        blurRadius: 12,
                                        offset: const Offset(0, 4),
                                        color: Colors.black.withOpacity(0.04),
                                        spreadRadius: 0),
                                  ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: canPop
                                    ? () {
                                        (leadingAction ?? context.pop)();
                                      }
                                    : null,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (canPop) ...[
                                      const SvgHelper(
                                          path:
                                              'assets/svg/arrow_left_black.svg'),
                                      const SizedBox(width: 8),
                                    ],
                                    leading ?? const SizedBox(),
                                    Text(title!,
                                        style: AppFonts.text16SemiBold.copyWith(
                                            height: 1.31,
                                            color: AppColors.TEXT_COLOR))
                                  ],
                                ),
                              ),
                              ...actions ?? [],
                            ],
                          ),
                        ),
                        if (child != null) child!
                      ],
                    ),
                  if (body != null)
                    if (isScrollable)
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          physics: scrollPhysics,
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          scrollDirection: Axis.vertical,
                          child: Container(
                            padding: padding,
                            constraints: const BoxConstraints(minHeight: 100),
                            child: body,
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: body!,
                      ),
                ],
              ),
              if (bottomBar != null) bottomBar!
            ],
          ),
        ),
      ),
    );
  }
}
