import 'package:app/ui/post_new_page/post_new_page_controller.dart';
import 'package:app/ui/post_new_page/widget_post_new_page/section_column.dart';
import 'package:flutter/material.dart';

class TwoLayout extends StatelessWidget {
  TwoLayout({super.key});

  final PostNewPageController controller = PostNewPageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SectionColumn(
              label: "Thông tin căn hôj", child: Text('a')),
          
        ],
      ),
    ));
  }
}