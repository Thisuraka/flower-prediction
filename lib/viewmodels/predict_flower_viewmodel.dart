import 'dart:convert';

import 'package:flower_prediction/models/base_api_response.dart';
import 'package:flower_prediction/models/weather_model.dart';
import 'package:flower_prediction/service/flower_service.dart';
import 'package:flower_prediction/utils/navigation_service.dart';
import 'package:flower_prediction/utils/urls.dart';
import 'package:flower_prediction/utils/utils.dart';
import 'package:flower_prediction/views/predict_flower/predict_flower.dart';
import 'package:flower_prediction/views/predict_flower/weather_prediction.dart';
import 'package:flower_prediction/widgets/popups/data_popup.dart';
import 'package:flower_prediction/widgets/popups/image_view_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PredictFlowerViewModel extends ChangeNotifier {
  final FlowerService service = FlowerService();

  List<WeatherModel> predictedWeather = [];

  final formKey = GlobalKey<FormState>();
  String? farmerLocation = "Colombo";
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

  void processWeather() async {
    try {
      BaseAPIResponse response = await service.predictFlower(UrlConstants.getFlowerWeatherEndpoint(), {
        "location": farmerLocation,
        "time_period": growingTimePeriodController.text,
        "ph_value": soilPhValueController.text,
      });
      if (response.error) {
        Utils.showSnackBar(
            'Something went wrong -- ${response.status}', NavigationService.navigatorKey.currentContext!);
      } else {
        if (response.data == "No suitable flowers") {
          Navigator.pop(NavigationService.navigatorKey.currentContext!);
          dataPopup('No suitable flowers found');
        } else {
          final List<dynamic> jsonList = json.decode(response.data['weather_data']);
          predictedWeather = jsonList.map((json) => WeatherModel.fromJson(json)).toList();

          Navigator.of(NavigationService.navigatorKey.currentContext!)
              .push(MaterialPageRoute(builder: (context) => WeatherPrediction()));
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      Navigator.pop(NavigationService.navigatorKey.currentContext!);
      Utils.showSnackBar('Something went wrong', NavigationService.navigatorKey.currentContext!);
    }
  }
}
