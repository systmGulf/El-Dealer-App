import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

List<Widget> categories = [
  Text(
    'All'.tr(),
    style: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: 'General Sans',
      fontWeight: FontWeight.w600,
      letterSpacing: 0.02,
    ),
  ),
  SvgPicture.asset('assets/svgs/car_model_dumy.svg'),
  SvgPicture.asset('assets/svgs/car_model_dumy.svg'),

  SvgPicture.asset('assets/svgs/car_model_dumy.svg'),
  SvgPicture.asset('assets/svgs/car_model_dumy.svg'),
];

class CategoriesContainer extends StatefulWidget {
  CategoriesContainer({
    super.key,
    required this.index,
    required this.selectedIndex,
  });
  int index;
  int selectedIndex;

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
                : const Color(0xFFEB5E28),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.15),
        ),
      ),
      child: Center(child: categories[widget.index]),
    );
  }
}
