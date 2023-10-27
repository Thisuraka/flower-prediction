import 'package:flower_prediction/service/flower_service.dart';
import 'package:flower_prediction/utils/navigation_service.dart';
import 'package:flower_prediction/views/predict_flower/predict_flower.dart';
import 'package:flower_prediction/views/predict_flower/weather_prediction.dart';
import 'package:flower_prediction/widgets/popups/image_view_popup.dart';
import 'package:flutter/material.dart';

class PredictFlowerViewModel extends ChangeNotifier {
  final FlowerService service = FlowerService();

  final formKey = GlobalKey<FormState>();
  String? farmerLocation;
  bool isWeather = true;
  TextEditingController soilPhValueController = TextEditingController();
  TextEditingController growingTimePeriodController = TextEditingController();

  Future<void> addInputs(BuildContext context) async {
    soilPhValueController.clear();
    growingTimePeriodController.clear();

    predictFlowerPopup(
      soilPhValueController: soilPhValueController,
      growingTimePeriodController: growingTimePeriodController,
      context: context,
      formKey: formKey,
      onSelected: (value) {
        farmerLocation = value;
      },
      onConfirm: () {
        if (formKey.currentState!.validate()) {
          Navigator.pop(context);

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PredictFlower()));
        }
      },
    );
  }

  void processMostSuitablePlant() async {
    Navigator.of(NavigationService.navigatorKey.currentContext!)
        .push(MaterialPageRoute(builder: (context) => WeatherPrediction()));
    // try {
    //   Map<String, dynamic> body = {
    //     "location": farmerLocation,
    //     'time_period': growingTimePeriodController,
    //     'ph_value': soilPhValueController
    //   };
    //   BaseAPIResponse response = await service.predictFlower(UrlConstants.getFlowerEndpoint(), body);
    //   if (response.error) {
    //     Utils.showSnackBar(
    //         'Something went wrong -- ${response.status}', NavigationService.navigatorKey.currentContext!);
    //   } else {
    //     print(response);
    //   }
    // } catch (e) {
    //   EasyLoading.dismiss();
    //   Navigator.pop(NavigationService.navigatorKey.currentContext!);
    //   Utils.showSnackBar('Something went wrong', NavigationService.navigatorKey.currentContext!);
    // }
  }
}
