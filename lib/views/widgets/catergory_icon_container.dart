import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CatergoryIconContainer extends StatefulWidget {
  const CatergoryIconContainer(
      {super.key,
      required this.iconUrl,
      required this.identifier,
      this.needBorder = true});
  final String iconUrl;
  final String identifier;
  final bool needBorder;
  @override
  State<CatergoryIconContainer> createState() => _CatergoryIconContainerState();
}

class _CatergoryIconContainerState extends State<CatergoryIconContainer> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.identifier,
      child: Container(
        width: 22.w,
        height: 11.h,
        padding: EdgeInsets.all(19.sp),
        decoration: BoxDecoration(
          border: !widget.needBorder
              ? null
              : Border.all(
                  width: .5, color: Theme.of(context).colorScheme.secondary),
        ),
        child: CachedNetworkImage(imageUrl: widget.iconUrl),
      ),
    );
  }
}
