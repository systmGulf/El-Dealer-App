import '../../features/home/data/models/car_response_model.dart';

extension CarsResponseModelExtension on CarsResponseModel {
  List<Items> filterByBrandName(String brandName) {
    return value?.items
            ?.where(
              (item) =>
                  item.brand?.name?.toLowerCase() == brandName.toLowerCase(),
            )
            .toList() ??
        [];
  }
}
