
import 'package:app/base/assets.dart';
import 'package:app/base/colors.dart';
import 'package:app/base/icons.dart';
import 'package:app/base/images.dart';
import 'package:app/base/routes.dart';
import 'package:app/model/label_model.dart';
import 'package:app/model/search_model.dart';
import 'package:app/widget/fab_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CustomBottomNavigation extends StatefulWidget {
  final Widget child;

  const CustomBottomNavigation({
    super.key,
    required this.child,
  });

  @override
  State<CustomBottomNavigation> createState() {
    return _CustomBottomNavigationState();
  }
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomBottomNavigation oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
        body: widget.child,
        primary: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () => _onItemTapped(2,),
          child: AppAssets.pngImage(IconPath.ic_post_news),
        ),
     bottomNavigationBar:
           
            
            FABBottomAppBar(
          color: AppColors.n777777,
          selectedColor: Colors.blue,
          selectedIndex: _calculateSelectedIndex(context),
          onTabSelected: (value) => _onItemTapped(value,),
          items: [
            FABBottomAppBarItem(iconData: Icons.mail, text: 'Gửi yêu cầu', image: AppAssets.svgIcon(IconPath.ic_evenllop_line,color: Colors.black),noti:false),
            FABBottomAppBarItem(
                iconData: Icons.location_city, text: 'Thuê BĐS',  image: AppAssets.svgIcon(IconPath.ic_key_line),noti:false),
            FABBottomAppBarItem(iconData: null, text: 'Đăng tin',  image:AppAssets.svgIcon(IconPath.ic_vi_line),noti:false),
            FABBottomAppBarItem(iconData: Icons.app_blocking, text: 'Mua BĐS', image: AppAssets.svgIcon(IconPath.ic_vi_line),noti:false),

            FABBottomAppBarItem(iconData: Icons.person, text: 'Cá nhân',  image: AppAssets.svgIcon(IconPath.ic_user_fill),noti:false),
          ],
          backgroundColor: Colors.white,
        ),
      resizeToAvoidBottomInset: false,


        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

 static int _calculateSelectedIndex(BuildContext context) {
  final String location = Get.currentRoute; // Get the current route using GetX
  if (location.endsWith(AppRoutes.sendRequire)) {
    return 0;
  }
  if (location.endsWith(AppRoutes.lease)) {
    return 1;
  }
  if (location.endsWith(AppRoutes.sell)) {
    return 3;
  }
  if (location.endsWith(AppRoutes.account)) {
    return 4;
  }
  return 2;
}

Future<void> _onItemTapped(int index) async {
  switch (index) {
    case 0:
      Get.toNamed(AppRoutes.sendRequire);
      break;
    case 1:
      Searchmodel searchmodel = Searchmodel(slectCatogory: LabelModal(label: 'Cho thuê', value: 'RENTING'));
      Get.toNamed(AppRoutes.lease, arguments: searchmodel);
      break;
    case 3:
      Searchmodel searchmodel = Searchmodel(slectCatogory: LabelModal(label: 'Bán', value: 'SELLING'));
      Get.toNamed(AppRoutes.lease, arguments: searchmodel);
      break;
    case 4:
      Get.toNamed(AppRoutes.account);
      break;
    case 2:
      final result = await Get.toNamed(AppRoutes.postNew);
      if (result != null && result == 'success') {
        print('Trở lại từ PostNew và đã thực hiện thành công!');
      }
      break;
    default:
      Get.toNamed(AppRoutes.home);
      break;
  }
}
}
