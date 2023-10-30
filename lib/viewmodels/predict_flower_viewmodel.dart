import 'dart:convert';

import 'package:flower_prediction/models/base_api_response.dart';
import 'package:flower_prediction/models/suitable_flower_model.dart';
import 'package:flower_prediction/models/weather_model.dart';
import 'package:flower_prediction/service/flower_service.dart';
import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/navigation_service.dart';
import 'package:flower_prediction/utils/static/suitable_flower_static.dart';
import 'package:flower_prediction/utils/urls.dart';
import 'package:flower_prediction/utils/utils.dart';
import 'package:flower_prediction/views/predict_flower/predict_flower.dart';
import 'package:flower_prediction/views/predict_flower/suitable_plants.dart';
import 'package:flower_prediction/views/predict_flower/weather_prediction.dart';
import 'package:flower_prediction/widgets/popups/data_popup.dart';
import 'package:flower_prediction/widgets/popups/image_view_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PredictFlowerViewModel extends ChangeNotifier {
  final FlowerService service = FlowerService();

  List<WeatherModel> predictedWeather = [];
  List<SuitableFlowerModel> suitablePlants = [];

  final formKey = GlobalKey<FormState>();
  String? farmerLocation = "Colombo";
  bool isWeather = true;
  TextEditingController soilPhValueController = TextEditingController();
  TextEditingController growingTimePeriodController = TextEditingController();

  Future<void> addInputs(BuildContext context) async {
    farmerLocation = "Colombo";
    soilPhValueController.clear();
    growingTimePeriodController.clear();

    predictFlowerPopup(
      soilPhValueController: soilPhValueController,
      growingTimePeriodController: growingTimePeriodController,
      context: context,
      formKey: formKey,
      selectedValue: farmerLocation!,
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
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorColor = Colors.white
      ..maskColor = const Color(0xDA1B0130)
      ..textColor = greenLvl1
      ..dismissOnTap = false;
    EasyLoading.show(status: 'loading...');
    try {
      BaseAPIResponse response = await service.predictFlower(UrlConstants.getFlowerWeatherEndpoint(), {
        "location": farmerLocation,
        "time_period": growingTimePeriodController.text,
        "ph_value": soilPhValueController.text,
      });
      if (response.error) {
        EasyLoading.dismiss();
        Utils.showSnackBar(
            'Something went wrong -- ${response.status}', NavigationService.navigatorKey.currentContext!);
      } else {
        print(response.data);
        EasyLoading.dismiss();
        if (response.data == "No suitable flowers") {
          dataPopup('No suitable flowers found');
        } else {
          final List<dynamic> jsonList = json.decode(response.data['weather_data']);
          predictedWeather = jsonList.map((json) => WeatherModel.fromJson(json)).toList();

          Navigator.of(NavigationService.navigatorKey.currentContext!)
              .push(MaterialPageRoute(builder: (context) => const WeatherPrediction()));
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      Navigator.pop(NavigationService.navigatorKey.currentContext!);
      Utils.showSnackBar('Something went wrong', NavigationService.navigatorKey.currentContext!);
    }
  }

  void processSuitable() async {
    suitablePlants = [];

    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorColor = Colors.white
      ..maskColor = const Color(0xDA1B0130)
      ..textColor = greenLvl1
      ..dismissOnTap = false;
    EasyLoading.show(status: 'loading...');

    try {
      BaseAPIResponse response = await service.predictFlower(UrlConstants.getFlowerWeatherEndpoint(), {
        "location": farmerLocation,
        "time_period": growingTimePeriodController.text,
        "ph_value": soilPhValueController.text,
      });
      if (response.error) {
        EasyLoading.dismiss();
        Utils.showSnackBar(
            'Something went wrong -- ${response.status}', NavigationService.navigatorKey.currentContext!);
      } else {
        EasyLoading.dismiss();
        if (response.data == "No suitable flowers") {
          dataPopup('No suitable flowers found');
        } else {
          final List bestSuggested = response.data['flower_data']['bestSuggested'];
          for (var flower in bestSuggested) {
            for (var flowerData in suitableFlowerData) {
              bool isOfType = flower.toLowerCase().contains(flowerData.classification!.toLowerCase());
              if (!isOfType) {
                break;
              }
              final updatedFlower = flowerData.copyWith(flowerName: flower);
              suitablePlants.add(updatedFlower);
            }
          }

          if (suitablePlants.isEmpty) {
            dataPopup('No suitable flowers found');
          } else {
            Navigator.of(NavigationService.navigatorKey.currentContext!)
                .push(MaterialPageRoute(builder: (context) => const SuitablePlants()));
          }
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      Utils.showSnackBar('Something went wrong', NavigationService.navigatorKey.currentContext!);
    }
  }
}


// {flower_data: {allEligible: [Hybrid Tea Rose, Grandiflora Rose, Floribunda Rose], bestSuggested: [Hybrid Tea Rose, Grandiflora Rose, Floribunda Rose], demand: 10109}, weather_data: [{"level_0":0,"index":0,"Month":"2023-11","predicted":25.8041778057},{"level_0":1,"index":1,"Month":"2023-12","predicted":25.6431524785},{"level_0":2,"index":2,"Month":"2024-01","predicted":26.1003173407},{"level_0":3,"index":3,"Month":"2024-02","predicted":26.9408546962},{"level_0":4,"index":4,"Month":"2024-03","predicted":27.5084126612},{"level_0":5,"index":5,"Month":"2024-04","predicted":27.3348200538},{"level_0":6,"index":6,"Month":"2024-05","predicted":27.1438602021}]}