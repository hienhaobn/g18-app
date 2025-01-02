
import 'package:app/base/colors.dart';
import 'package:app/base/styles.dart';
import 'package:flutter/material.dart';

class BuildDropDown<T> extends StatelessWidget {
  final bool isExpanded;
  final bool isDense;
  final String hintText;
  final T? currentValue;
  final void Function(T?)? onChange;
  final double? maxHeight;
  final double? itemHeight;
  final List<DropdownMenuItem<T>> childs;
  const BuildDropDown(
      {Key? key,
      this.isExpanded = true,
      this.hintText = '',
      required this.childs,
      this.isDense = false,
      this.maxHeight,
      this.currentValue,
      this.itemHeight,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      isExpanded: isExpanded,
      menuMaxHeight: maxHeight,
      itemHeight: itemHeight,
      isDense: isDense,
      hint: Text(
        hintText,
        style: AppStyles.normalStyle.copyWith(color: AppColors.textSmall),
      ),
      underline: Container(),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.active,
      ),
      style: TextStyle(fontSize: 12),
      dropdownColor: Colors.white,
      value: currentValue,
      onChanged: onChange,
      items: childs,
    );
  }
}

class BuildDropDownV2<T> extends StatelessWidget {
  final bool isExpanded;
  final bool isDense;
  final String hintText;
  final T? currentValue;
  final void Function(T?)? onChange;
  final double? maxHeight;
  final double? itemHeight;
  final List<DropdownMenuItem<T>> childs;
  final TextStyle? stylehint;
  final Color? colorsIconDrop;
  const BuildDropDownV2(
      {Key? key,
      this.isExpanded = true,
      this.hintText = '',
      required this.childs,
      this.isDense = false,
      this.maxHeight,
      this.currentValue,
      this.itemHeight,
      this.onChange,
      this.stylehint,
      this.colorsIconDrop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      isExpanded: isExpanded,
      menuMaxHeight: maxHeight,
      itemHeight: itemHeight,
      isDense: isDense,
      hint: Text(
        hintText,
        style: stylehint ?? AppStyles.titleStyleV2,
      ),
      underline: Container(),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: colorsIconDrop ?? AppColors.p4C28A5,
      ),
      style: AppStyles.contentStyleV2,
      dropdownColor: Colors.white,
      value: currentValue,
      onChanged: onChange,
      items: childs,
    );
  }
}

class BuildDropDownV22<T> extends StatelessWidget {
  final bool isExpanded;
  final bool isDense;
  final String hintText;
  final TextStyle? styleHintext;
  final T? currentValue;
  final void Function(T?)? onChange;
  final double? maxHeight;
  final double? itemHeight;
  final List<DropdownMenuItem<T>> childs;
  const BuildDropDownV22(
      {Key? key,
      this.isExpanded = true,
      this.hintText = '',
      required this.childs,
      this.isDense = false,
      this.maxHeight,
      this.currentValue,
      this.itemHeight,
      this.onChange,
      this.styleHintext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      isExpanded: isExpanded,
      menuMaxHeight: maxHeight,
      itemHeight: itemHeight,
      isDense: isDense,
      hint: Text(
        hintText,
        style: styleHintext ?? AppStyles.contentStyleV2,
      ),
      underline: Container(),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.active,
      ),
      style: TextStyle(fontSize: 12),
      dropdownColor: Colors.white,
      value: currentValue,
      onChanged: onChange,
      items: childs,
    );
  }
}
