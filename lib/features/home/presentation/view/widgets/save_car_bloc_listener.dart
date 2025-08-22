import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eldealer/core/common/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/custom_loading_indicator.dart';
import '../controller/car_cubit/car_cubit.dart';
import '../controller/saved_cars_cubit/saved_cars_cubit.dart';

class SaveCarBlocListener extends StatelessWidget {
  const SaveCarBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SavedCarsCubit, SavedCarsState>(
      listenWhen:
          (previous, current) =>
              current is SaveCarSuccess ||
              current is SaveCarFailure ||
              current is SaveCarLoading,
      listener: (context, state) {
        if (state is SaveCarFailure) {
          context.pop();
          DelightToastBar(
            autoDismiss: true,
            builder:
                (context) => ToastCard(
                  color: Colors.red,
                  leading: Icon(Icons.error_outline, size: 28),
                  title: Text(
                    state.errorMsg,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
          ).show(context);
        } else if (state is SaveCarSuccess) {
          DelightToastBar(
            autoDismiss: true,
            builder:
                (context) => ToastCard(
                  color: Colors.green,
                  leading: Icon(Icons.check, size: 28),
                  title: Text(
                    'Car saved successfully'.tr(context: context),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
          ).show(context);
        } else if (state is SaveCarLoading) {}
      },
      child: SizedBox.shrink(),
    );
  }
}
