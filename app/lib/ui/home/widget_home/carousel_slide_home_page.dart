import 'package:app/base_hieu/spacing_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderWidget extends StatefulWidget {
  final List<String> listBanner; // Danh sách URL hình ảnh
  final int index;

  const CarouselSliderWidget({
    super.key,
    required this.listBanner,
    required this.index,
  });

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
    late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider hiển thị các hình ảnh
        CarouselSlider(
          items: widget.listBanner.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return AspectRatio(
                  aspectRatio: 16 / 9, // Đảm bảo tỷ lệ 16:9
                  child: CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 195, // Chiều cao slider
            viewportFraction: 0.8,
            enableInfiniteScroll: true,
            reverse: false,
             initialPage: currentIndex,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds:1),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
        ),
        10.height,
          AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: widget.listBanner.length,
          effect: ExpandingDotsEffect(
            dotHeight: 10, // Chiều cao của dot không được chọn
            dotWidth: 10,  // Chiều rộng của dot không được chọn
            activeDotColor: Theme.of(context).primaryColor, // Màu của dot được chọn
            dotColor: Colors.grey, // Màu của các dot không được chọn
            expansionFactor: 2, // Độ mở rộng của dot khi được chọn
          ),
        ),


      ],
    );
  }
}
