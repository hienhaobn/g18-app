import 'package:app/base_hieu/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
mixin AppAssets {
  static SvgPicture svgIcon(
    String name, {
    Color? color,
    double? height,
    double? width,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      name,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static SvgPicture svgImage(
    String name, {
    Color? color,
    double? height,
    double? width,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      name,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static Image pngImage(
    String name, {
    Color? color,
    double? height,
    double? width,
    BoxFit fit = BoxFit.contain,
  }) {
    return Image.asset(
      name,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static Widget networkImage(
    String url, {
    double? height,
    double? width,
    BoxFit fit = BoxFit.contain,
  }) {
    return ImageNetWork(
      url: url,
      fit: fit,
      height: height,
      width: width,
    );
  }
}
