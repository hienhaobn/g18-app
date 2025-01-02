import 'package:flutter/widgets.dart';

// Extension cho kiểu int hoặc double
extension SpacingExtension on num {
  // width cho phép tạo SizedBox với width
  Widget get width => SizedBox(width: toDouble());
  
  // height cho phép tạo SizedBox với height
  Widget get height => SizedBox(height: toDouble());
}
