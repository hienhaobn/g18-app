import 'package:app/base/assets.dart';
import 'package:app/base/base_get_view.dart';
import 'package:app/base/colors.dart';
import 'package:app/base/const.dart';
import 'package:app/base/convert_value_2.dart';
import 'package:app/base/icons.dart';
import 'package:app/base/images.dart';
import 'package:app/base/spacing_extension.dart';
import 'package:app/model/community_data_model.dart';
import 'package:app/ui/community/card_community_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardCommunity extends BaseGetWidget<CardCommunityController> {
  const CardCommunity({super.key});

  @override
  CardCommunityController get controller => Get.put(CardCommunityController());

  @override
  Widget build(BuildContext context) {
    return buildLoading(
        child: Scaffold(
          backgroundColor: Colors.transparent,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _inforSa(context),
              5.height,
              _title(),
              _address(),
              10.height,

              _imageDescription(context),

              10.height,

              _iconInforAndAction(),

              10.height,

              _informationDetailListWidget(),
              10.height,

       


              // if (widget.checkshowComment) _containerExchange(context),
              // if (widget.checkshowComment)
              //   SizedBox(
              //     height: 10,
              //   ),
              // if (widget.checkshowComment) _numberInteractions(),
            ],
          ),
        ),
      ),
    ));
  }

  //1 ----------------------------------------------------------------------
  Widget _inforSa(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/icons/g18iconAvata.jpg'),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '1234',
                style: controller.fontController.currentFontStyle
                    .copyWith(fontSize: 14, color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/images/ic_crown.png'),
                    height: 12,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Đá",
                    style: controller.fontController.currentFontStyle
                        .copyWith(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image(
                    image: AssetImage('assets/images/ic_earth.png'),
                    height: 12,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "6 Ngày",
                    style: controller.fontController.currentFontStyle.copyWith(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(flex: 1, child: _iconHoriz(context)),
      ],
    );
  }

  Widget _iconHoriz(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25),
      child: GestureDetector(
        onTap: () {
          // controller?.showBottomSheetContent(context);
        },
        child: Icon(Icons.more_horiz),
      ),
    );
  }

  //2 ----------------------------------------------------------------------

  Widget _title() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        child: Text(
          "Cho thuê nhà ngõ",
          style: controller.fontController.currentFontStyle.copyWith(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1, // Giới hạn số dòng là 2
          overflow:
              TextOverflow.ellipsis, // Hiển thị dấu ... nếu văn bản quá dài
        ),
      ),
    );
  }
  //3 ----------------------------------------------------------------------

  Widget _address() {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200),
            child: Icon(
              Icons.location_on,
              size: 15,
            )),
        SizedBox(
          width: 5,
        ),
        Flexible(
          child: Text(
            "địa chỉ chi tiết",
            style: controller.fontController.currentFontStyle.copyWith(
                fontSize: 14,
                color: Color(0xFF555555),
                fontWeight: FontWeight
                    .w400), // TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
  //4 ----------------------------------------------------------------------

  Widget _imageDescription(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: EMPTY_AVATAR,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, loadingProgress) =>
                  Center(
                child:
                    CircularProgressIndicator(value: loadingProgress.progress),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel(
                      label: "Thuê" ?? '',
                      color: Colors.grey ?? Colors.transparent),
                  _buildLabel(label: "Nhà ngõ", color: Colors.pink),
                  _buildLabel(label: "Mới" ?? '', color: getColorStatus('new')),
                ],
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: dannhan != null ? Colors.orange : null,
                      color: Colors.orange,
                    ),
                    child: Text(
                      'G18 Home',
                      // '${dannhan != null ? dannhan : ""}',
                      style:
                          controller.fontController.currentFontStyle.copyWith(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      // AppFonts.inter(
                      //   color: Colors.white,
                      //   fontSize: 10 ,
                      //   fontWeight: FontWeight.w500,
                      // ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Positioned.fill to center the text over the image
          // if (widget.item.video_360!.length > 0)
          //   Positioned.fill(
          //       child: Center(
          //     child: Assets.icons.icon360.svg(width: 60, height: 60),
          //   )),

          // if (showDiscription.length > 2)
          Positioned.fill(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20), // Horizontal padding if needed
                child: Transform.translate(
                  offset: Offset(0,
                      10), // Adjust the vertical position (positive for down)
                  child: Container(
                    padding: EdgeInsets.all(4),
                    color: Colors.grey.withOpacity(0.5),
                    child: Text(
                      "showDiscription", // Text to display at the center
                      // style:
                      // AppFonts.inter(
                      //   fontSize: 18,
                      //   color: Colors.white,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      //  controllerSett.fontController.currentFontStyle.copyWith(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold,),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel({required String label, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Text(
        label,
        style: controller.fontController.currentFontStyle.copyWith(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
  //5 ----------------------------------------------------------------------

  Widget _iconInforAndAction() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            children: [
              // Assets.icons.icPrice.image(
              //   width: 20,
              //   height: 20,
              // ),
              AppAssets.pngImage(ImagePath.img_price),
              SizedBox(width: 5),
              Flexible(
                child: Text(
                  'Liên hệ',
                  //  (showPriceText != "0") ? "${(showPriceText)}"  :"Liên hệ",//convertToCurrencyUnit4
                  style: controller.fontController.currentFontStyle.copyWith(
                    color: Color(0xFF333333),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            children: [
              AppAssets.pngImage(ImagePath.img_percent),
              SizedBox(width: 5),
              Flexible(
                child: Text(
                  'Liên hệ',
                  //  (showCostText != "0") ? "${showCostText}" : "Liên hệ",
                  // "${(widget.item.price_text)}",//convertToCurrencyUnit4
                  style: controller.fontController.currentFontStyle.copyWith(
                    color: Color(0xFF333333),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
              onTap: () async {
                //  setState(() {
                //     widget.item.likeStatus = !widget.item.likeStatus!;
                //  });
              },
              child:
                  AppAssets.svgIcon(IconPath.ic_favorite, color: AppColors.red)
              // Assets.icons.icFavoriteUnSelected2.svg(
              //     width: 24,
              //     height: 24,
              //     colorFilter: ColorFilter.mode(
              //        widget.item.likeStatus == true ? Colors.red.shade500 : Colors.black,
              //       BlendMode.srcIn,
              //     )),
              ),
        )
      ],
    );
  }

  //6 ----------------------------------------------------------------------
  Widget _informationDetailListWidget() {
    return Container(
      constraints: BoxConstraints(
        minHeight:
            30, // Thay đổi giá trị này để đặt chiều cao tối thiểu bạn muốn
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // if (widget.item.showareaOutside != null && parseDouble(widget.item.showareaOutside!) > 0) ...[
            _informationDetailWidget(IconPath.ic_area_m2, "${123} m²"),
            // ],
            // if (widget.item.showNumberBadroom != null) ...[
            SizedBox(width: 6),
            _informationDetailWidget(IconPath.ic_bed, "${5} PN"),
            // ],
            // if (widget.item.showdNumberToilet != null && widget.item.showdNumberToilet != "null" && parseInt(widget.item.showdNumberToilet) > 0) ...[
            SizedBox(width: 6),
            _informationDetailWidget(IconPath.ic_toilet, "${4}"),
            // ],
            // if (widget.item.showAcreage != null && parseDouble(widget.item.showAcreage) > 0) ...[
            SizedBox(width: 6),
            _informationDetailWidget(IconPath.ic_area_m, "${111} m"),
            // ],
            // if (widget.item.showdirection != null && widget.item.showdirection != "null" && widget.item.showdirection!.isNotEmpty) ...[
            SizedBox(width: 6),
            _informationDetailWidget(IconPath.ic_direction, "Bắc"),
            // ],
            SizedBox(width: 2),
          ],
        ),
      ),
    );
  }

  Widget _informationDetailWidget(String image, String name) {
    if (name.isEmpty) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFEFEFEF),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppAssets.svgIcon(image, width: 20, height: 20),
          SizedBox(
            width: 4,
          ),
          Text(name,
              style:
                  // TextStyle(
                  //   color: Color(0xFF555555),
                  //   fontSize: 14,
                  //   fontWeight: FontWeight.w400,
                  //   fontFamily: 'Inter',
                  // ),
                  controller.fontController.currentFontStyle.copyWith(
                color: Color(0xFF555555),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )),
        ],
      ),
    );
  }

  //7 ----------------------------------------------------------------------
}
