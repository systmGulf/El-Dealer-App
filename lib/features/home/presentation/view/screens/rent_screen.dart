import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/core/widgets/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

import '../../../../../core/styles/app_text_styles.dart';

class RentScreen extends StatefulWidget {
  const RentScreen({super.key});

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
  int pricePerDay = 250;
  int totalPrice = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Text(
              '$totalPrice \$',
              style: AppTextStyles.font20MontserratBold,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text('Book Now'.tr(context: context)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ScrollableCleanCalendar(
              locale: context.locale.languageCode,
              scrollController: ScrollController(initialScrollOffset: 0.0),
              dayDisableBackgroundColor: Colors.transparent,
              daySelectedBackgroundColor: AppColors.orangeColor,
              calendarController: CleanCalendarController(
                minDate: DateTime.now(),
                maxDate: DateTime.now().add(const Duration(days: 30)),
                onRangeSelected: (firstDate, secondDate) {
                  totalPrice =
                      (secondDate?.difference(firstDate).inDays ?? 0 + 1) *
                      pricePerDay;
                },
                onDayTapped: (date) {},
                onPreviousMinDateTapped: (date) {},

                onAfterMaxDateTapped: (date) {},
                weekdayStart: DateTime.monday,
              ),
              layout: Layout.BEAUTY,
              calendarCrossAxisSpacing: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomAppButton(
              textButton: 'Book Now'.tr(context: context),
              buttonColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
