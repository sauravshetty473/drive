import 'package:flutter/material.dart';

import '../dm_snackbar.dart';

extension BuildContextExtended on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  Future push(Widget widget) => Navigator.of(this).push(
        PageRouteBuilder(
          opaque: true,
          pageBuilder: (_, __, ___) => widget,
        ),
      );

  Future transparentPush(Widget widget) => Navigator.of(this).push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, __, ___) => widget,
        ),
      );

  Future transparentPushReplacement(Widget widget) =>
      Navigator.of(this).pushReplacement(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, __, ___) => widget,
        ),
      );

  Future transparentRemoveAllAndPush(Widget widget) =>
      Navigator.of(this).pushAndRemoveUntil(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, __, ___) => widget,
        ),
        (Route<dynamic> route) => false,
      );

  Future removeAllAndPush(Widget page) => Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page),
        (Route<dynamic> route) => false,
      );

  Future removeAllAndPushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        routeName,
        arguments: arguments,
        (Route<dynamic> route) => false,
      );

  Future pushReplacement(Widget widget) => Navigator.of(this).pushReplacement(
        MaterialPageRoute(
          builder: (_) => widget,
        ),
      );

  Future pushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(
        routeName,
        arguments: arguments,
      );

  Future pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(
        routeName,
        arguments: arguments,
      );

  popDialog() => Navigator.of(this, rootNavigator: true).pop(
        'dialog',
      );

  pop() => Navigator.of(this).pop();

  popResult(bool result) => Navigator.of(this).pop(result);

  showBottomSheet({required Widget modalSheet}) => showModalBottomSheet(
      useRootNavigator: false,
      context: this,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return modalSheet;
      });

  removeAllFocus() {
    FocusScope.of(this).requestFocus(FocusNode());
  }

  showMessage(String message) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));

  showError(String message) => showDmSnackBar(
        this,
        DmSnackBarType.error,
        message,
      );

  showSuccess(String message) => showDmSnackBar(
        this,
        DmSnackBarType.success,
        message,
      );

  Size get querySize => MediaQuery.of(this).size;
}
