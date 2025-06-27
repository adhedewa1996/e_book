import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_books/core/config/constants/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppImage {
  static Widget assets({
    required String name,
    double? width,
    double? height,
    BoxFit? fit, //
  }) {
    return Image.asset(name, height: height, width: width, fit: fit);
  }

  static Widget network({
    required String url,
    double? width,
    double? height, //
  }) {
    return AppImageCache(url, width: width, height: height);
  }

  static Widget svg({
    required String name,
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.fill, //
  }) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        name,
        height: height,
        width: width,
        // ignore: deprecated_member_use
        color: color,
        fit: fit,
      ),
    );
  }

  static Widget randomImageCover(BuildContext context) {
    return Container(
      child: AppImage.svg(name: Helper.randomHorizontalImage(), fit: BoxFit.fill, width: context.width, height: context.height),
    );
  }

  static Widget randomImageCoverVertical(BuildContext context) {
    return Container(
      child: AppImage.svg(name: Helper.randomVerticalImage(), fit: BoxFit.fill, width: context.width, height: context.height),
    );
  }
}

class AppImageCache extends StatefulWidget {
  const AppImageCache(this.url, {super.key, this.fit, this.height, this.width, this.gaplessPlayback, this.callback, this.color, this.defaultErrorImage, this.isError});

  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final bool? gaplessPlayback;
  final Function(bool)? callback;
  final Color? color;
  final String? defaultErrorImage;
  final Function(bool)? isError;

  @override
  State<AppImageCache> createState() => _AppImageCacheState();
}

class _AppImageCacheState extends State<AppImageCache> {
  @override
  void dispose() {
    CachedNetworkImage.evictFromCache(widget.url);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: GlobalKey(),
      imageUrl: widget.url,
      fit: widget.fit ?? BoxFit.fill,
      width: widget.width ?? context.width,
      height: widget.height ?? context.width,
      color: widget.color,
      placeholder: (context, url) {
        return AppImage.randomImageCover(context);
      },
      errorListener: (value) {
        widget.isError?.call(true);
      },
      errorWidget: (context, url, error) {
        return AppImage.randomImageCover(context);
      },
      filterQuality: FilterQuality.medium,
    );
  }
}
