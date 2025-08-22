import 'package:cached_network_image/cached_network_image.dart';
import 'package:eldealer/core/env/env.dart';
import 'package:eldealer/features/home/data/models/brand_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/app_colors.dart';

// ignore: must_be_immutable
class CategoriesContainer extends StatefulWidget {
  CategoriesContainer({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.brandResponseModel,
  });
  int index;
  int selectedIndex;
  final Value brandResponseModel;

  @override
  State<CategoriesContainer> createState() => _CategoriesContainerState();
}

class _CategoriesContainerState extends State<CategoriesContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88.w,
      height: 56.h,
      padding: const EdgeInsets.all(2.46),
      decoration: ShapeDecoration(
        color:
            widget.index != widget.selectedIndex
                ? const Color(0xFF252422)
                : AppColors.orangeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.15),
        ),
      ),
      child: Center(
        child: CachedNetworkImage(
          imageUrl: "${Env.baseUrl}${widget.brandResponseModel.logo}",
          height: 40.h,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
