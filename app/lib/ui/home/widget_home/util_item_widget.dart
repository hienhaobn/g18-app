import 'package:app/base_hieu/assets.dart';
import 'package:app/base_hieu/styles.dart';
import 'package:flutter/cupertino.dart';


class UtilItemWidget extends StatefulWidget {
  UtilItemWidget(
      {required this.image, required this.name, required this.onPress});

  final String image;
  final String name;
  final VoidCallback onPress;

  @override
  State<UtilItemWidget> createState() => _UtilItemWidgetState();
}

class _UtilItemWidgetState extends State<UtilItemWidget> {



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          AppAssets.svgIcon(widget.image,height: 60, width: 60),
            SizedBox(height: 8),
            Text(
              widget.name,
              style:AppStyles.textW400(context, size: 12)
                // controllerSett.fontController.currentFontStyle.copyWith( color: Color(0xFF333333), fontSize: 12,fontWeight: FontWeight.w400,)  //  TextStyle(
              //   color: Color(0xFF333333),
              //   fontSize: 12,
              //   fontWeight: FontWeight.w400,
              //   fontFamily: 'Inter',
              // )
              ,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
