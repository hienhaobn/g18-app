
import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? iconPrefix;
  final Widget? iconSufix;
  final String hintText;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final EdgeInsets? padding;
  final bool isShowSuffix;
  final bool readOnly;
  final Color? fillColor;
  final FocusNode? focusNode;
  final double? fontSize;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final TextStyle? errorStyle;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;
  final bool? expands;
  final TextAlign? textAlign;
  final String? initialValue;
  final String? suffixText;
  final Color? cursorColor; // Thêm biến cursorColor

  final int? maxLines;
  final int? minLines;
  final AutovalidateMode? autovalidateMode;
  const InputText({
    Key? key,
    this.controller,
    this.iconPrefix,
    this.iconSufix,
    this.textInputType,
    this.onChanged,
    this.focusNode,
    this.inputFormatters,
    this.obscureText = false,
    this.suffixText,
    required this.hintText,
    this.textInputAction = TextInputAction.next,
    this.padding,
    this.validator,
    this.enabledBorder,
    this.focusedBorder,
    this.expands,
    this.isShowSuffix = false,
    this.readOnly = false,
    this.fillColor,
    this.fontSize,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.errorStyle,
    this.style,
    this.textAlign,
    this.initialValue,
    this.maxLines,
    this.minLines,
    this.onTap,
    this.autovalidateMode,
    this.cursorColor, this.hintStyle, // Thêm cursorColor vào constructor
  }) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: widget.cursorColor, // Sử dụng biến cursorColor
      initialValue: widget.initialValue,
      controller: widget.controller,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      inputFormatters: widget.inputFormatters,
      style: widget.style ??
          AppStyles.normalStyle.copyWith(
              fontSize: widget.fontSize ?? AppStyles.normalStyle.fontSize),
      focusNode: widget.focusNode,
      obscureText: widget.isShowSuffix ? obscureText : widget.obscureText,
      autovalidateMode:
          widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      textCapitalization: widget.textCapitalization,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines,
      textAlign: widget.textAlign ?? TextAlign.start,
      expands: widget.expands ?? false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: widget.fillColor ?? Colors.white,
        prefixIcon: widget.iconPrefix,
        suffixText: widget.suffixText,
        prefixIconConstraints:
            const BoxConstraints(minWidth: 54, minHeight: 46),
        hintStyle: widget.hintStyle ?? AppStyles.normalStyle.copyWith(
            color: AppColors.hint,
            fontSize: widget.fontSize ?? AppStyles.normalStyle.fontSize),
        suffixIcon: widget.isShowSuffix ? _buildSuffixIcon() : widget.iconSufix,
        contentPadding: widget.padding,
        filled: true,
        errorStyle: widget.errorStyle,
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Theme.of(context).dividerColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 2)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red)),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return InkWell(
      onTap: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      child: obscureText
          ? const Icon(Icons.visibility_off, color: AppColors.active)
          : const Icon(Icons.visibility, color: AppColors.active),
    );
  }
}


//------------


class InputText2 extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? iconPrefix;
  final Widget? iconSufix;
  final Widget? label;
  final String hintText;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final EdgeInsets? padding;
  final bool isShowSuffix;
  final bool readOnly;
  final Color? fillColor;
  final FocusNode? focusNode;
  final double? fontSize;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final int? maxLines;
  final TextStyle? errorStyle;
  final TextStyle? style;
  final TextStyle? styleHint;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusErrorBorder;
  final OutlineInputBorder? errordBorder;
  final OutlineInputBorder? focusedBorder;
  final TextAlign? textAlign;
  final String? initialValue;
  final double? boderCi;
  const InputText2(
      {Key? key,
      this.controller,
      this.iconPrefix,
      this.iconSufix,
      this.textInputType,
      this.onChanged,
      this.label,
      this.focusNode,
      this.inputFormatters,
      this.obscureText = false,
      required this.hintText,
      this.textInputAction = TextInputAction.next,
      this.padding,
      this.validator,
      this.enabledBorder,
      this.isShowSuffix = false,
      this.readOnly = false,
      this.fillColor,
      this.fontSize,
      this.textCapitalization = TextCapitalization.none,
      this.maxLength,
      this.maxLines,
      this.errorStyle,
      this.style,
      this.textAlign,
      this.initialValue,
      this.onTap,
      this.styleHint,
      this.boderCi,
      this.focusErrorBorder,
      this.errordBorder,
      this.focusedBorder})
      : super(key: key);

  @override
  _Input2TextState createState() => _Input2TextState();
}

class _Input2TextState extends State<InputText2> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      maxLines: widget.maxLines,
      initialValue: widget.initialValue,
      controller: widget.controller,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      inputFormatters: widget.inputFormatters,
      style: widget.style ??
          AppStyles.normalStyle.copyWith(
              fontSize: widget.fontSize ?? AppStyles.normalStyle.fontSize),
      focusNode: widget.focusNode,
      obscureText: widget.isShowSuffix ? obscureText : widget.obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      textCapitalization: widget.textCapitalization,
      maxLength: widget.maxLength,
      textAlign: widget.textAlign ?? TextAlign.start,
      decoration: InputDecoration(
      
        hintText: widget.hintText,
        label: widget.label,
        fillColor: widget.fillColor ?? Colors.white,
        prefixIcon: widget.iconPrefix,
        prefixIconConstraints:
            const BoxConstraints(minWidth: 54, minHeight: 46),
        hintStyle: widget.styleHint ??
            AppStyles.contentStyleV2.copyWith(
                color: AppColors.hint,
                fontSize: widget.fontSize ?? AppStyles.contentStyleV2.fontSize),
        suffixIcon: widget.isShowSuffix ? _buildSuffixIcon() : widget.iconSufix,
        contentPadding: widget.padding,
        filled: true,
        errorStyle: widget.errorStyle,
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.boderCi ?? 8),
                borderSide: BorderSide(color: Theme.of(context).dividerColor)),
        focusedErrorBorder: widget.focusErrorBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.boderCi ?? 8),
                borderSide: const BorderSide(color: Colors.red, width: 2)),
        errorBorder: widget.errordBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.boderCi ?? 8),
                borderSide: const BorderSide(color: Colors.red)),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.boderCi ?? 8),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return InkWell(
      onTap: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      child: obscureText
          ? const Icon(Icons.visibility_off, color: AppColors.p4C28A5)
          : const Icon(Icons.visibility, color: AppColors.p4C28A5),
    );
  }
}

class InputText22 extends StatefulWidget {
  final String? title;
  final TextEditingController? controller;
  final Widget? iconPrefix;
  final Widget? iconSufix;
  final Widget? label;
  final String hintText;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final EdgeInsets? padding;
  final bool isShowSuffix;
  final bool readOnly;
  final Color? fillColor;
  final FocusNode? focusNode;
  final double? fontSize;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final int? maxLines;
  final TextStyle? errorStyle;
  final TextStyle? style;
  final TextStyle? styleTitle;
  final TextStyle? hintStyle;
  final OutlineInputBorder? enabledBorder;
  final TextAlign? textAlign;
  final String? initialValue;
  final bool showRedAsterisk;
  const InputText22(
      {Key? key,
      this.title,
      this.controller,
      this.iconPrefix,
      this.iconSufix,
      this.textInputType,
      this.onChanged,
      this.label,
      this.focusNode,
      this.inputFormatters,
      this.obscureText = false,
      required this.hintText,
      this.textInputAction = TextInputAction.next,
      this.padding,
      this.validator,
      this.enabledBorder,
      this.isShowSuffix = false,
      this.readOnly = false,
      this.fillColor,
      this.fontSize,
      this.textCapitalization = TextCapitalization.none,
      this.maxLength,
      this.maxLines,
      this.errorStyle,
      this.style,
      this.styleTitle,
      this.textAlign,
      this.initialValue,
      this.onTap,
      this.hintStyle,
      this.showRedAsterisk = false})
      : super(key: key);

  @override
  _Input22TextState createState() => _Input22TextState();
}

class _Input22TextState extends State<InputText22> {
  bool obscureText = true;
  bool showRick = true;
  @override
  Widget build(BuildContext context) {
    String _title = widget.title ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row(
        //   children: [
        //     Text(
        //       widget.title ?? '',
        //       style: widget.styleTitle,
        //     ),
        //     if (widget.showRedAsterisk)
        //       Text(
        //         ' (*)',
        //         style: AppStyles.contentStyleV2.copyWith(color: Colors.red) ??
        //             TextStyle(color: Colors.red),
        //       ),
        //   ],
        // ),
        // widget.showRedAsterisk
        //     ? TextRequired(text: _title)
        //     : TextNoneRequired(text: _title),
        SizedBox(
          height: 4,
        ),
        TextFormField(
          maxLines: widget.maxLines,
          initialValue: widget.initialValue,
          controller: widget.controller,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          inputFormatters: widget.inputFormatters,
          style: widget.style ??
              AppStyles.normalStyle.copyWith(
                  fontSize: widget.fontSize ?? AppStyles.normalStyle.fontSize),
          focusNode: widget.focusNode,
          obscureText: widget.isShowSuffix ? obscureText : widget.obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          textCapitalization: widget.textCapitalization,
          maxLength: widget.maxLength,
          textAlign: widget.textAlign ?? TextAlign.start,
          decoration: InputDecoration(
            hintText: widget.hintText,
            label: widget.label,
            fillColor: widget.fillColor ?? Colors.white,
            prefixIcon: widget.iconPrefix,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 54, minHeight: 46),
            hintStyle: widget.hintStyle,
            suffixIcon:
                widget.isShowSuffix ? _buildSuffixIcon() : widget.iconSufix,
            contentPadding: widget.padding,
            filled: true,
            errorStyle: widget.errorStyle,
            enabledBorder: widget.enabledBorder ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        BorderSide(color: Theme.of(context).dividerColor)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.red, width: 2)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuffixIcon() {
    return InkWell(
      onTap: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      child: obscureText
          ? const Icon(Icons.visibility_off, color: AppColors.active)
          : const Icon(Icons.visibility, color: AppColors.active),
    );
  }
}
//------------------------------------------------------------------------



class InputTextVer2 extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? iconPrefix;
  final Widget? iconSufix;
  final String hintText;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final EdgeInsets? padding;
  final bool isShowSuffix;
  final bool readOnly;
  final Color? fillColor;
  final FocusNode? focusNode;
  final double? fontSize;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final TextStyle? errorStyle;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;
  final bool? expands;
  final TextAlign? textAlign;
  final String? initialValue;
  final String? suffixText;
  final Color? cursorColor; // Thêm biến cursorColor

  final int? maxLines;
  final int? minLines;
  final AutovalidateMode? autovalidateMode;
  const InputTextVer2({
    Key? key,
    this.controller,
    this.iconPrefix,
    this.iconSufix,
    this.textInputType,
    this.onChanged,
    this.focusNode,
    this.inputFormatters,
    this.obscureText = false,
    this.suffixText,
    required this.hintText,
    this.textInputAction = TextInputAction.next,
    this.padding,
    this.validator,
    this.enabledBorder,
    this.focusedBorder,
    this.expands,
    this.isShowSuffix = false,
    this.readOnly = false,
    this.fillColor,
    this.fontSize,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.errorStyle,
    this.style,
    this.textAlign,
    this.initialValue,
    this.maxLines,
    this.minLines,
    this.onTap,
    this.autovalidateMode,
    this.cursorColor, this.hintStyle, // Thêm cursorColor vào constructor
  }) : super(key: key);

  @override
  _InputTextVer2State createState() => _InputTextVer2State();
}

class _InputTextVer2State extends State<InputTextVer2> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: widget.cursorColor, // Sử dụng biến cursorColor
      initialValue: widget.initialValue,
      controller: widget.controller,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      inputFormatters: widget.inputFormatters,
      style: widget.style ??
          AppStyles.normalStyle.copyWith(
              fontSize: widget.fontSize ?? AppStyles.normalStyle.fontSize),
      focusNode: widget.focusNode,
      obscureText: widget.isShowSuffix ? obscureText : widget.obscureText,
      autovalidateMode:
          widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      textCapitalization: widget.textCapitalization,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines,
      textAlign: widget.textAlign ?? TextAlign.start,
      expands: widget.expands ?? false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: widget.fillColor ?? Colors.white,
        prefixIcon: widget.iconPrefix,
        suffixText: widget.suffixText,
        prefixIconConstraints:
            const BoxConstraints(minWidth: 54, minHeight: 46),
        hintStyle: widget.hintStyle ?? AppStyles.normalStyle.copyWith(
            color: AppColors.hint,
            fontSize: widget.fontSize ?? AppStyles.normalStyle.fontSize),
        suffixIcon: widget.isShowSuffix ? _buildSuffixIcon() : widget.iconSufix,
        contentPadding: widget.padding,
        filled: true,
        errorStyle: widget.errorStyle,
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Theme.of(context).dividerColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 2)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red)),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return InkWell(
      onTap: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      child: obscureText
          ? const Icon(Icons.visibility_off, color: AppColors.p4C28A5)
          : const Icon(Icons.visibility, color: AppColors.p4C28A5),
    );
  }
}

