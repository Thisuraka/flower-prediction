import 'package:flower_prediction/models/base_api_response.dart';
import 'package:flower_prediction/models/growth_model.dart';
import 'package:flower_prediction/utils/navigation_service.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/utils/static/growth_static.dart';
import 'package:flower_prediction/utils/urls.dart';
import 'package:flower_prediction/utils/utils.dart';
import 'package:flower_prediction/views/growth_detection/growth_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flower_prediction/service/flower_service.dart';
import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/camera_helper.dart';
import 'package:flower_prediction/widgets/popups/image_view_popup.dart';

class GrowthViewModel extends ChangeNotifier {
  final FlowerService service = FlowerService();
  GrowthModel growthModel = GrowthModel();

  XFile? imageFile;
  bool isGen = false;

  int selectedMonthForGrowth = 0;

  void setGen() {
    isGen = !isGen;
  }

  Future<void> addImage(BuildContext context, bool isCamera) async {
    if (isCamera) {
      imageFile = await CameraHelper.takeImages();
    } else {
      imageFile = await CameraHelper.selectImages();
    }

    selectedMonthForGrowth = 1;

    if (context.mounted) {
      growthImageViewPopup(
        title: AppStrings.plantGrowthPrediction,
        desc: AppStrings.plantGrowthPredictionDesc,
        context: context,
        imageFile: imageFile,
        onTap: () {
          EasyLoading.instance
            ..displayDuration = const Duration(milliseconds: 2000)
            ..indicatorColor = Colors.white
            ..maskColor = const Color(0xDA1B0130)
            ..textColor = greenLvl1
            ..dismissOnTap = false;
          EasyLoading.show(status: 'loading...');
          process();
        },
        onSelected: (value) {
          if (value != null) {
            if (value == '6+') {
              selectedMonthForGrowth = 6;
            } else {
              selectedMonthForGrowth = int.parse(value);
            }
          }
        },
      );
    }

    setGen();
  }

  void process() async {
    Function(int, int)? onSendProgress;

    BaseAPIResponse response = await service.predictGrowth(
        imageFile!, selectedMonthForGrowth, onSendProgress, UrlConstants.getGrowthEndpoint());
    if (response.error) {
      EasyLoading.dismiss();
      Navigator.pop(NavigationService.navigatorKey.currentContext!);
      Utils.showSnackBar(
          'Something went wrong -- ${response.status}', NavigationService.navigatorKey.currentContext!);
    } else {
      try {
        EasyLoading.dismiss();
        growthModel = growthStatic.firstWhere((element) => element.key == response.data['level']);
        Navigator.pop(NavigationService.navigatorKey.currentContext!);
        Navigator.of(NavigationService.navigatorKey.currentContext!)
            .push(MaterialPageRoute(builder: (context) => const GrowthDetection()));
      } catch (e) {
        EasyLoading.dismiss();
        Navigator.pop(NavigationService.navigatorKey.currentContext!);
        Utils.showSnackBar('Something went wrong', NavigationService.navigatorKey.currentContext!);
      }
    }
  }
}
