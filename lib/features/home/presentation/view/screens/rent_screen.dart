import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/app_spaces.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:eldealer/core/styles/app_colors.dart';
import 'package:eldealer/core/widgets/custom_app_button.dart';
import 'package:eldealer/core/widgets/custom_app_text_form_field.dart';
import 'package:eldealer/features/home/presentation/view/controller/rent_car/rent_car_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

import '../../../../../core/styles/app_text_styles.dart';

class RentScreen extends StatefulWidget {
  const RentScreen({super.key, required this.carId});
  final int carId;

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
  ValueNotifier<int> pricePerDay = ValueNotifier(0);
  int difference = 0;
  @override
  void initState() {
    super.initState();
    difference = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,

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
                  if (secondDate != null) {
                    difference = secondDate.difference(firstDate).inDays + 1;
                    context.read<RentCarCubit>().startData = firstDate
                        .toString()
                        .substring(0, 10);
                    context.read<RentCarCubit>().endData = secondDate
                        .toString()
                        .substring(0, 10);
                  }
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
              onPressed: () {
                difference != 0
                    ? showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (_) {
                        return BlocProvider.value(
                          value: context.read<RentCarCubit>(),

                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: IntrinsicHeight(
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Complete Booking'.tr(context: context),
                                      style: AppTextStyles.font20MontserratBold,
                                    ),
                                    verticalSpace(10),
                                    Text(
                                      "Rent for : $difference Days",
                                      style: AppTextStyles.font14Medium
                                          .copyWith(color: Colors.white),
                                    ),
                                    verticalSpace(10),
                                    CustomAppTextFormField(
                                      controller:
                                          context
                                              .read<RentCarCubit>()
                                              .nameController,
                                      hint: 'Enter Full Name',
                                    ),
                                    verticalSpace(10),
                                    CustomAppTextFormField(
                                      controller:
                                          context
                                              .read<RentCarCubit>()
                                              .emailController,
                                      hint: 'Enter Email'.tr(context: context),
                                    ),
                                    verticalSpace(10),
                                    CustomAppTextFormField(
                                      controller:
                                          context
                                              .read<RentCarCubit>()
                                              .phoneController,
                                      hint: 'Enter Phone Number'.tr(
                                        context: context,
                                      ),
                                    ),
                                    verticalSpace(10),
                                    CustomAppButton(
                                      textButton: 'Book Now'.tr(
                                        context: context,
                                      ),
                                      buttonColor: Colors.white,
                                      onPressed: () {
                                        context.read<RentCarCubit>().carId =
                                            widget.carId;
                                        if (context
                                                .read<RentCarCubit>()
                                                .carId !=
                                            0) {
                                          context
                                              .read<RentCarCubit>()
                                              .rentCar();
                                          context.pop();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                    : DelightToastBar(
                      position: DelightSnackbarPosition.top,
                      autoDismiss: true,
                      builder:
                          (context) => ToastCard(
                            color: Colors.orange,
                            leading: Icon(Icons.error_outline, size: 28),
                            title: Text(
                              'Select Date'.tr(context: context),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                    ).show(context);
              },
              textButton: 'Book Now'.tr(context: context),
              buttonColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
