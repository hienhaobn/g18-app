import 'package:app/base/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class FABBottomAppBarItem {
  IconData? iconData;
  SvgPicture image;
  String text;
  bool? noti = false;

  FABBottomAppBarItem(
      {required this.iconData,
      required this.text,
      required this.image,
      this.noti});
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    required this.items,
    this.iconSize = 30.0,
    this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.onTabSelected,
    required this.selectedIndex,
  }) {
    assert(this.items.length == 2 || this.items.length == 5);
  }
  final List<FABBottomAppBarItem> items;
  final double iconSize;
  final Color? backgroundColor;
  final Color color;
  final Color selectedColor;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
          item: widget.items[index],
          index: index,
          onPressed: _updateIndex,
          selected: widget.selectedIndex == index);
    });

    return BottomAppBar(
      padding: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      height: 50,
      shadowColor: Colors.black12,
      elevation: 2,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
    required bool selected,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: GestureDetector(
          onTap: () {
            onPressed(index);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // item.image,
              SizedBox(width: 24, height: 24, child: item.image),
              Text(
                item.text,
                style: TextStyle(color: color, fontSize: index == 2 ? 14 : 12),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
