// ignore_for_file: non_constant_identifier_names, use_super_parameters

import 'package:app/base/assets.dart';
import 'package:app/base/base_get_view.dart';
import 'package:app/base/colors.dart';
import 'package:app/base/icons.dart';
import 'package:app/base/images.dart';
import 'package:app/base/search_dropdown.dart';
import 'package:app/base/spacing_extension.dart';
import 'package:app/base/styles.dart';
import 'package:app/ui/home/home_page_controller.dart';
import 'package:app/ui/home/widget_home/carousel_slide_home_page.dart';
import 'package:app/ui/home/widget_home/util_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/widget/custom_bottom_navigation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart'; // Import the CustomBottomNavigation widget

class HomePage extends BaseGetWidget<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  HomePageController get controller => Get.put(HomePageController());

  final List<Widget> _buildScreens = [
    Center(child: Text("Gửi yêu cầu")),
    Center(child: Text("Thuê BĐS")),
    Center(child: Text("Đăng tin")),
    Center(child: Text("Mua BĐS")),
    Center(child: Text("Tài khoản")),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBottomNavigation(
      child: Obx(
        () => Scaffold(
            body: controller.selectedIndex.value == -1
                ? Column(
                  children: [
                    _build_homePage_AppBar(context),
                    Expanded(
                      child: SmartRefresher(
                                  controller: controller.refreshController,
                                  enablePullDown: true,
                                  enablePullUp: false,
                                  onRefresh: () async {
                                    // await GetListProductREN();
                                    // await GetListProductSell();
                                    // await GetListProjectt();
                                    // await GetListCommunity();
                                    controller. refreshController.refreshCompleted();
                                  },
                                  child: SingleChildScrollView(
                                    child: child(),
                                  ),
                                ),
                    )
                  ],
                ) // Nội dung mặc định
                : _buildScreens[controller.selectedIndex.value]),
      ),
    );
  }

  Widget _build_homePage_AppBar(BuildContext context) {
    return Stack(
  children: [
    Container(
      child: AppAssets.pngImage(ImagePath.img_bg_appbar),
    ),
    Positioned(
      top: 65,
      left: 16,
      right: 16, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn giữa các phần tử 2 bên
        children: [
          // Phần bên trái
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 20,
                ),
              ),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Xin chào',
                    style: AppStyles.textW400(context,
                        size: 16, color: AppColors.white),
                  ),
                  Text(
                    'Mai Quốc Đạt',
                    style: AppStyles.textW700(context,
                        size: 18, color: AppColors.white),
                  )
                ],
              ),
            ],
          ),
          // Phần bên phải
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 20,
                  child: AppAssets.svgIcon(IconPath.ic_search),
                ),
              ),
              11.width,
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 20,
                  child: AppAssets.svgIcon(IconPath.ic_notifi),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
)
;
  }
  
  Widget child() => Builder(builder: (context) {
    final List<String> _names = ['John', 'Jane', 'James', 'Jack', 'Jill', 'Joe'];
     final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

      
        return Container(
          padding: EdgeInsets.only(bottom: 16),
          color: Colors.white,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  CarouselSliderWidget(
                    listBanner: controller.banerImage,
                    index: controller.indexBanner.value,
                  ),
                 12.height,
                  _utilWidget(context),
                   12.height,
                  // _communityListWidget(itemWidth, itemHeight),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // _sellListWidget(itemWidth, itemHeight),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // _leaseListWidget(itemWidth, itemHeight),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // _projectListWidget(itemWidth, projectItemHeight),
            //       SearchDropdown<String>(
            //   hintText: 'Search for a name',
            //   controller: _controller,
            //   focusNode: _focusNode,
            //   itemBuilder: (context, suggestion) {
            //     return ListTile(
            //       title: Text(suggestion),
            //     );
            //   },
            //   suggestions: (pattern) async {
            //     // Lọc danh sách tên dựa trên văn bản nhập vào
            //     return _names
            //         .where((name) => name.toLowerCase().contains(pattern.toLowerCase()))
            //         .toList();
            //   },
            //   onTapSuggestion: (suggestion) {
            //     // Làm gì đó khi người dùng chọn một tên
            //     print('Selected: $suggestion');
            //   },
            //   onClearCreated: () {
            //     // Làm gì đó khi người dùng xóa văn bản
            //     print('Search cleared');
            //   },
            // ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        );
      });
      
     Widget _utilWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tiện ích",
            textAlign: TextAlign.start,
            style: AppStyles.textW700(context, size: 18)
            ,
          ),
          SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UtilItemWidget(
                  image: IconPath.ic_bds_sell,
                  name: "BĐS bán",
                  onPress: () {
                    // Searchmodel searchmodel = Searchmodel(
                    //     slectCatogory:
                    //         LabelModal(label: 'Cần bán', value: 'SELLING'));
                    // GoRouter.of(context)
                    //     .goNamed(NameRouter.sell.name, extra: searchmodel);
                  },
                ),
                UtilItemWidget(
                  image: IconPath.ic_bds_lease,
                  name: "BĐS cho thuê",
                  onPress: () {
                    // Searchmodel searchmodel = Searchmodel(
                    //     slectCatogory:
                    //         LabelModal(label: 'Cho thuê', value: 'RENTING'));
                    // GoRouter.of(context)
                    //     .goNamed(NameRouter.lease.name, extra: searchmodel);
                  },
                ),
                UtilItemWidget(
                      image: IconPath.ic_report,
                      name: "Báo cáo",
                      onPress: () {
                        // GoRouter.of(context).go(NameRouter.Baocaoscreen.path);
                      },
                    ),
                UtilItemWidget(
                  image: IconPath.ic_ware_house,
                  name: "Kho tin",
                  onPress: () {
                    // GoRouter.of(context).pushNamed(NameRouter.warehouse.name);
                  },
                ),
                UtilItemWidget(
                  image: IconPath.ic_community,
                  name: "Cộng đồng",
                  onPress: () {
                    // GoRouter.of(context).go(NameRouter.community.path);
                  },
                ),
                UtilItemWidget(
                  image:IconPath.ic_project,
                  name: "Dự án",
                  onPress: () {
                    // GoRouter.of(context)
                    //     .pushNamed(NameRouter.projectPostsList.name);
                  },
                ),
                UtilItemWidget(
                  image:IconPath.ic_required_ware_house,
                  name: "Yêu cầu",
                  onPress: () {
                    // GoRouter.of(context)
                    //     .pushNamed(NameRouter.requireWarehouse.name);
                  },
                ),
                UtilItemWidget(
                  image: IconPath.ic_my_ware_house,
                  name: "Kho của tôi",
                  onPress: () {
                    // GoRouter.of(context).pushNamed(NameRouter.myWarehouse.name);
                  },
                ),
                // Observer(
                //   builder: (context) {
                //     return checkPermission(
                //             'request_customer_phone', appStore.listpermissions)
                //         ? 
                //         : SizedBox
                //             .shrink(); // Trả về widget trống nếu không có quyền
                //   },
                // )
                UtilItemWidget(
                            image:IconPath.ic_phanyeucau,
                            name: "Phân yêu cầu",
                            onPress: () {
                              // GoRouter.of(context)
                              //     .pushNamed(NameRouter.Phanyeucauscreen.name);
                            },
                          )
              ],
            ),
          )
        ],
      ),
    );
  }
}
