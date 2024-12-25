import 'package:app/base_hieu/colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle bigStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Lato-SemiBold',
      height: 1.5);
  static const TextStyle text18Style = TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Lato-SemiBold',
      height: 1.5);
  static const TextStyle biggestStyle = TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'Lato-SemiBold',
      height: 1.5);
  static const TextStyle titleStyle = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'Lato-SemiBold',
      height: 1.5);
  static const TextStyle titleStyleW8 = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w800,
      fontFamily: 'Lato-Bold',
      height: 1.5);
  static const TextStyle normalStyle = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Lato-Medium',
      height: 1.5);
  static const TextStyle captionStyle = TextStyle(
      color: AppColors.caption,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'Lato-Medium',
      height: 1.5);
  static const TextStyle smallStyle = TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontFamily: 'Lato-Medium',
      height: 1.5);

  static const TextStyle tinyStyle = TextStyle(
      color: Colors.black,
      fontSize: 7,
      fontWeight: FontWeight.w400,
      fontFamily: 'Lato-Medium',
      height: 1.5);
  static const TextStyle originMoney = TextStyle(
      color: AppColors.textCaption,
      fontSize: 8,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.lineThrough,
      fontFamily: 'Lato-Medium',
      height: 1.5);

  static const TextStyle titleStyleMedium = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Lato-Medium',
      height: 1.5);
  static const TextStyle titleStyleNormal = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Lato-Regular',
      height: 1.5);
  static const TextStyle titleStyleW5 = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Lato-Regular',
      height: 1.5);
  static const TextStyle bigStyleNormal = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontFamily: 'Lato-Regular',
      height: 1.5);
  static TextStyle normalStyleAuto(
      {FontWeight fontWeight = FontWeight.w400,
      Color? color,
      double fontSize = 14}) {
    String _fontFamily = 'Lato-Medium';
    switch (fontWeight.index) {
      case 0:
      case 1:
      case 2:
      case 3:
        _fontFamily = 'Lato-Light';
        break;
      case 4:
        _fontFamily = 'Lato-Medium';
        break;
      case 5:
        _fontFamily = 'Lato-SemiBold';
        break;
      case 6:
        _fontFamily = 'Lato-Bold';
        break;
      default:
        _fontFamily = 'Lato-Bold';
    }
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: _fontFamily,
        height: 1.5);
  }

  static TextStyle bigStyleAuto(
      {FontWeight fontWeight = FontWeight.w400, Color? color}) {
    String _fontFamily = 'Lato-Medium';
    switch (fontWeight.index) {
      case 0:
      case 1:
      case 2:
      case 3:
        _fontFamily = 'Lato-Light';
        break;
      case 4:
        _fontFamily = 'Lato-Medium';
        break;
      case 5:
        _fontFamily = 'Lato-SemiBold';
        break;
      case 6:
        _fontFamily = 'Lato-Bold';
        break;
      default:
        _fontFamily = 'Lato-Bold';
    }
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: 20,
        fontWeight: fontWeight,
        fontFamily: _fontFamily,
        height: 1.5);
  }

  static TextStyle captionStyleAuto(
      {FontWeight fontWeight = FontWeight.w400, Color? color}) {
    return TextStyle(
        color: color ?? AppColors.caption,
        fontSize: 12,
        fontWeight: fontWeight,
        fontFamily: _getFontFamilyByWeight(fontWeight),
        height: 1.5);
  }

  static TextStyle smallStyleAuto(
      {FontWeight fontWeight = FontWeight.w400, Color? color}) {
    return TextStyle(
        color: color ?? AppColors.caption,
        fontSize: 10,
        fontWeight: fontWeight,
        fontFamily: _getFontFamilyByWeight(fontWeight),
        height: 1.5);
  }

  static String _getFontFamilyByWeight(FontWeight fontWeight) {
    int index = fontWeight.index;
    switch (index) {
      case 0:
      case 1:
      case 2:
      case 3:
        return 'Lato-Light';
      case 4:
        return 'Lato-Medium';
      case 5:
        return 'Lato-SemiBold';
      case 6:
        return 'Lato-Bold';
      default:
        return 'Lato-Bold';
    }
  }

  static const TextStyle titleStyleV2 = TextStyle(
      color: AppColors.hint,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: 'Lato-SemiBold',
      height: 1.5);

  static const TextStyle contentStyleV2 = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: 'Lato-SemiBold',
      height: 1.5);

  static const TextStyle contentStyleV3 = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: 'Lato-SemiBold',
      height: 1);

//

  static const TextStyle contentStyleW700S8Tour = TextStyle(
      color: Colors.black,
      fontSize: 8,
      fontWeight: FontWeight.w700,
      // fontFamily: 'Lato',
      height: 1);
  static const TextStyle contentStyleW500S10 = TextStyle(
      color: AppColors.hint,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      // fontFamily: 'Lato',
      height: 1);
  static const TextStyle contentStyleW400S10Tour = TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      // fontFamily: 'Lato',
      height: 1);
  static const TextStyle contentStyleW400S12 = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      // fontFamily: 'Lato',
      height: 1);
  static const TextStyle contentStyleW700S10Tour = TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      // fontFamily: 'Lato',
      height: 1);
  static const TextStyle contentStyleW700S12 = TextStyle(
      color: AppColors.cC91B23,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      // fontFamily: 'Lato',
      height: 1);
  static const TextStyle contentStyleW700S14 = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      // fontFamily: 'Lato',
      height: 1);
  static const TextStyle contentStyleW900S10 = TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.w900,
      // fontFamily: 'Lato',
      height: 1);

  static const TextStyle contentStyleW900S12Tour = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w900,
      // fontFamily: 'Lato',
      height: 1);

  static const TextStyle contentStyleW900S16 = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w900,
      // fontFamily: 'Lato',
      height: 1);

  ///
  static TextStyle _getTextStyle(
    BuildContext context, {
    required double size,
    required FontWeight fontWeight,
    FontStyle? fontStyle,
    Color? color = AppColors.blackText,
    double? lineHeight = 16,
    TextDecoration? decoration,
  }) {
    final height =
        (lineHeight != null && lineHeight > size) ? lineHeight / size : 1.0;

    return Theme.of(context).textTheme.bodySmall!.copyWith(
        fontSize: size,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        height: height,
        decoration: decoration,
        fontFamily: 'Lato-Medium');
  }

  static TextStyle textW900(
    BuildContext context, {
    required double size,
    FontStyle? fontStyle,
    Color? color = AppColors.blackText,
    double? lineHeight,
    TextDecoration? decoration,
  }) {
    return _getTextStyle(
      context,
      size: size,
      fontWeight: FontWeight.w900,
      fontStyle: fontStyle,
      color: color,
      lineHeight: lineHeight,
      decoration: decoration,
    );
  }

  static TextStyle textW400(
    BuildContext context, {
    required double size,
    FontStyle? fontStyle,
    Color? color = AppColors.blackText,
    double? lineHeight,
    TextDecoration? decoration,
  }) {
    return _getTextStyle(
      context,
      size: size,
      fontWeight: FontWeight.w400,
      fontStyle: fontStyle,
      color: color,
      lineHeight: lineHeight,
      decoration: decoration,
    );
  }

  static TextStyle textW500(
    BuildContext context, {
    required double size,
    FontStyle? fontStyle,
    Color? color = AppColors.blackText,
    double? lineHeight,
    TextDecoration? decoration,
  }) {
    return _getTextStyle(
      context,
      size: size,
      fontWeight: FontWeight.w500,
      fontStyle: fontStyle,
      color: color,
      lineHeight: lineHeight,
      decoration: decoration,
    );
  }

  static TextStyle textW600(
    BuildContext context, {
    required double size,
    FontStyle? fontStyle,
    Color? color = AppColors.blackText,
    double? lineHeight,
    TextDecoration? decoration,
  }) {
    return _getTextStyle(
      context,
      size: size,
      fontWeight: FontWeight.w600,
      fontStyle: fontStyle,
      color: color,
      lineHeight: lineHeight,
      decoration: decoration,
    );
  }

  static TextStyle textW700(
    BuildContext context, {
    required double size,
    FontStyle? fontStyle,
    Color? color = AppColors.blackText,
    double? lineHeight,
    TextDecoration? decoration,
  }) {
    return _getTextStyle(
      context,
      size: size,
      fontWeight: FontWeight.w700,
      fontStyle: fontStyle,
      color: color,
      lineHeight: lineHeight,
      decoration: decoration,
    );
  }
}
