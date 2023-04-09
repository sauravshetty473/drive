import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';

class SvgHelper extends StatelessWidget {
  const SvgHelper({
    Key? key,
    required this.path,
    this.scale = 1,
    this.color,
  }) : super(key: key);

  final String path;
  final double scale;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ScalableImageWidget.fromSISource(
      scale: scale,
      si: ScalableImageSource.fromSvg(
        DefaultAssetBundle.of(context),
        path,
        currentColor: color,
      ),
    );
  }
}
