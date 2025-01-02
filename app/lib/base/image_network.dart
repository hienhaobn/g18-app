import 'package:app/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageNetWork extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Widget? errorChild;
  const ImageNetWork(
      {Key? key,
      required this.url,
      this.height,
      this.width,
      this.fit,
      this.errorChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      errorWidget: (context, error, stackTrace) {
        return errorChild ??
            Container(
              width: width,
              height: height,
              color: AppColors.unActive,
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 26,
                  color: Colors.grey[300],
                ),
              ),
            );
      },
    );
  }
}
