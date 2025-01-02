import 'dart:async';
import 'package:app/base/colors.dart';
import 'package:app/base/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

// class SearchDropdown<T> extends StatefulWidget {
//   final String hintText;
//   final Widget Function(BuildContext, T) itemBuilder;
//   final FutureOr<Iterable<T>> Function(String)? suggestions;
//   final void Function(T) onTapSuggestion;
//   final void Function()? onClearCreated;
//   final FocusNode focusNode;
//   final TextEditingController controller;
//   final TextStyle? styleHint;
//   final TextStyle? styleT;
//   final double? sizz;
//   final List<TextInputFormatter>? inputFormatters;
//   final TextInputType? textInputType;
//   final Color? focusedBorderColor;
//   const SearchDropdown({
//     Key? key,
//     required this.itemBuilder,
//     required this.suggestions,
//     required this.onTapSuggestion,
//     required this.hintText,
//     this.onClearCreated,
//     required this.focusNode,
//     required this.controller,
//     this.styleHint,
//     this.sizz,
//     this.styleT,
//     this.inputFormatters,
//     this.textInputType,
//     this.focusedBorderColor,
//   }) : super(key: key);

//   @override
//   State<SearchDropdown<T>> createState() => _SearchDropdownState<T>();
// }

// class _SearchDropdownState<T> extends State<SearchDropdown<T>> {
//   bool _isShowIconClose = false;
//   @override
//   void initState() {
//     _isShowIconClose = widget.controller.text.isNotEmpty;
//     widget.focusNode.addListener(() {
//       if (widget.focusNode.hasFocus) {
//         widget.controller.text = '';
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TypeAheadField<T>(
//       textFieldConfiguration: TextFieldConfiguration(
//           autofocus: false,
//           focusNode: widget.focusNode,
//           controller: widget.controller,
//           style: widget.styleT ?? AppStyles.normalStyle,
//           inputFormatters: widget.inputFormatters,
//           keyboardType: widget.textInputType ?? TextInputType.text,
//           decoration: InputDecoration(
//               contentPadding:
//                   EdgeInsets.symmetric(horizontal: widget.sizz ?? 16),
//               hintText: widget.hintText,
//               fillColor: Colors.white,
//               filled: true,
//               suffixIcon: _isShowIconClose
//                   ? InkWell(
//                       onTap: () {
//                         setState(() {
//                           widget.controller.clear();
//                         });
//                         if (widget.onClearCreated != null) {
//                           widget.onClearCreated!();
//                         }
//                       },
//                       child: Icon(
//                         Icons.close,
//                         color: AppColors.active,
//                       ),
//                     )
//                   : Icon(
//                       Icons.keyboard_arrow_down,
//                       color: widget.focusedBorderColor ?? AppColors.active,
//                     ),
//               hintStyle: widget.styleHint ??
//                   AppStyles.normalStyle.copyWith(color: AppColors.hint),
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide:
//                       BorderSide(color: Theme.of(context).dividerColor)),
//               focusedErrorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.red, width: 2)),
//               errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.red)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide(
//                       color: widget.focusedBorderColor ??
//                           Theme.of(context).primaryColor)))),
//       suggestionsCallback: widget.suggestions ??
//           (pattern) {
//             return [];
//           },
//       itemBuilder: widget.itemBuilder,
//       onSuggestionSelected: widget.onTapSuggestion,
//       noItemsFoundBuilder: (context) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           child: Text(
//             "Không tìm thấy",
//             style: AppStyles.normalStyle.copyWith(color: AppColors.hint),
//           ),
//         );
//       },
//       transitionBuilder: (context, child, controller) {
//         return child;
//       },
//     );
//   }
// }

// class SearchDropdown2<T> extends StatefulWidget {
//   final String hintText;
//   final Widget Function(BuildContext, T) itemBuilder;
//   final FutureOr<Iterable<T>> Function(String)? suggestions;
//   final void Function(T) onTapSuggestion;
//   final void Function()? onClearCreated;
//   final FocusNode focusNode;
//   final TextEditingController controller;
//   const SearchDropdown2(
//       {Key? key,
//       required this.itemBuilder,
//       required this.suggestions,
//       required this.onTapSuggestion,
//       required this.hintText,
//       this.onClearCreated,
//       required this.focusNode,
//       required this.controller})
//       : super(key: key);

//   @override
//   State<SearchDropdown2<T>> createState() => _SearchDropdown2State<T>();
// }

// class _SearchDropdown2State<T> extends State<SearchDropdown2<T>> {
//   bool _isShowIconClose = false;
//   @override
//   void initState() {
//     _isShowIconClose = widget.controller.text.isNotEmpty;
//     widget.focusNode.addListener(() {
//       if (widget.focusNode.hasFocus) {
//         widget.controller.text = '';
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TypeAheadField<T>(
//           textFieldConfiguration: TextFieldConfiguration(
//               autofocus: false,
//               focusNode: widget.focusNode,
//               controller: widget.controller,
//               style: AppStyles.normalStyle,
//               decoration: InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                   hintText: widget.hintText,
//                   fillColor: Colors.white,
//                   filled: true,
//                   suffixIcon: _isShowIconClose
//                       ? InkWell(
//                           onTap: () {
//                             setState(() {
//                               widget.controller.clear();
//                             });
//                             if (widget.onClearCreated != null) {
//                               widget.onClearCreated!();
//                             }
//                           },
//                           child: Icon(
//                             Icons.close,
//                             color: AppColors.active,
//                           ),
//                         )
//                       : Icon(
//                           Icons.keyboard_arrow_down,
//                           color: AppColors.active,
//                         ),
//                   hintStyle:
//                       AppStyles.contentStyleV2.copyWith(color: AppColors.hint),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4),
//                       borderSide:
//                           BorderSide(color: Theme.of(context).dividerColor)),
//                   focusedErrorBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4),
//                       borderSide:
//                           const BorderSide(color: Colors.red, width: 2)),
//                   errorBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4),
//                       borderSide: const BorderSide(color: Colors.red)),
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4),
//                       borderSide:
//                           BorderSide(color:  Theme.of(context).primaryColor)))),
//           suggestionsCallback: widget.suggestions ??
//               (pattern) {
//                 return [];
//               },
//           itemBuilder: widget.itemBuilder,
//           onSuggestionSelected: widget.onTapSuggestion,
//           noItemsFoundBuilder: (context) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Text(
//                 "Không tìm thấy",
//                 style: AppStyles.normalStyle.copyWith(color: AppColors.hint),
//               ),
//             );
//           },
//           transitionBuilder: (context, child, controller) {
//             return child;
//           },
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchDropdown<T> extends StatefulWidget {
  final String hintText;
  final Widget Function(BuildContext, T) itemBuilder;
  final FutureOr<Iterable<T>> Function(String)? suggestions;
  final void Function(T) onTapSuggestion;
  final void Function()? onClearCreated;
  final FocusNode focusNode;
  final TextEditingController controller;
  final TextStyle? styleHint;
  final TextStyle? styleT;
  final double? sizz;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final Color? focusedBorderColor;

  const SearchDropdown({
    Key? key,
    required this.itemBuilder,
    required this.suggestions,
    required this.onTapSuggestion,
    required this.hintText,
    this.onClearCreated,
    required this.focusNode,
    required this.controller,
    this.styleHint,
    this.sizz,
    this.styleT,
    this.inputFormatters,
    this.textInputType,
    this.focusedBorderColor,
  }) : super(key: key);

  @override
  State<SearchDropdown<T>> createState() => _SearchDropdownState<T>();
}

class _SearchDropdownState<T> extends State<SearchDropdown<T>> {
  bool _isShowIconClose = false;

  @override
  void initState() {
    super.initState();
    _isShowIconClose = widget.controller.text.isNotEmpty;
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        widget.controller.text = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<T>(
      builder: (context, controller, focusNode) {
        return TextField(
            controller: controller,
            focusNode: focusNode,
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              // labelText: 'City',
              hintText: 'Tìm kiếm'
            ));
      },
      suggestionsCallback: (pattern) async {
        if (widget.suggestions != null) {
          final suggestions = await widget.suggestions!(pattern);
          return suggestions?.toList() ?? [];
        }
        return [];
      },
      itemBuilder: widget.itemBuilder,
      onSelected: widget.onTapSuggestion,
      emptyBuilder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Không tìm thấy",
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
    );
  }
}
