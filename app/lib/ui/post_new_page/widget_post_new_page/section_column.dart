import 'package:app/base_hieu/spacing_extension.dart';
import 'package:app/base_hieu/styles.dart';
import 'package:flutter/material.dart';

class SectionColumn extends StatelessWidget {
  final String label;
  final Widget child;
  final Color? colorLabel;
  const SectionColumn(
      {super.key,
      required this.label,
      required this.child,
       this.colorLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // title row
        Row(
          children: [
            Text(
              label,
              style: AppStyles.titleStyle.copyWith(color: colorLabel),
            ),
            8.width, // Sử dụng SizedBox thay cho 8.width
            Expanded( // Sử dụng Expanded thay cho .expand()
              child: Divider(
                height: 0.5,
                thickness: 0.5,
              ),
            ),
          ],
        ),
        16.height ,
         child// Sử dụng SizedBox thay cho 16.height
           ],
    );
  }
}
