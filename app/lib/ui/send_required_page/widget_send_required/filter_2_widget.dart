// import 'package:chotbds/src/screen/setting/setting_controller.dart';
import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Filter2Widget extends StatefulWidget {
  final Function(String? status) onDateRangeSelected;
  final String? initValue;

  Filter2Widget({required this.onDateRangeSelected, this.initValue});

  @override
  _Filter2WidgetState createState() => _Filter2WidgetState();
}

class _Filter2WidgetState extends State<Filter2Widget> {
  bool? checkshow = null;

  // final SettingController controllerSett = Get.put(SettingController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.initValue!=null){
      setState(() {
        checkshow=widget.initValue=="BUYING";

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      checkshow = true;
                    });
                    widget.onDateRangeSelected("BUYING");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: checkshow == true ? AppColors.p4C28A5 : Colors.white,
                    foregroundColor: checkshow == true ? Colors.white : Colors.black,
                  ),
                  child: Text("Tìm mua BĐS",style:AppStyles.textW700(context, size: 16,color: checkshow == true ? Colors.white : Colors.black )
                  // controllerSett.fontController.currentFontStyle.copyWith(color: checkshow == true ? Colors.white : Colors.black),
                  )
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      checkshow = false;
                    });
                    widget.onDateRangeSelected("RENTING");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: checkshow == false ? AppColors.p4C28A5 : Colors.white,
                    foregroundColor: checkshow == false ? Colors.white : Colors.black,
                  ),
                  child: Text('Tìm thuê BĐS',style:AppStyles.textW700(context, size: 16,color: checkshow == true ? Colors.black : Colors.white)
                  // controllerSett.fontController.currentFontStyle.copyWith(color: checkshow == true ? Colors.black : Colors.white)
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}