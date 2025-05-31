import 'package:flutter/material.dart';

import '../../../../../core/common/app_spaces.dart';
import '../widgets/car_in_favourite_widget.dart';
import '../widgets/saved_car_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            SavedCarWidget(),
            verticalSpace(16),
            Column(
              children: List.generate(
                10,

                (index) => const CarInFavouriteWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
