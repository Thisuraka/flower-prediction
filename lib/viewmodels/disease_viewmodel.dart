import 'package:flower_prediction/models/base_api_response.dart';
import 'package:flower_prediction/models/disease_model.dart';
import 'package:flower_prediction/utils/navigation_service.dart';
import 'package:flower_prediction/utils/static/app_strings.dart';
import 'package:flower_prediction/utils/static/diseases_static.dart';
import 'package:flower_prediction/utils/urls.dart';
import 'package:flower_prediction/utils/utils.dart';
import 'package:flower_prediction/views/disease_detection/disease_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flower_prediction/service/flower_service.dart';
import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/camera_helper.dart';
import 'package:flower_prediction/widgets/popups/image_view_popup.dart';

class DiseaseViewModel extends ChangeNotifier {
  final FlowerService service = FlowerService();
  DiseaseModel diseaseModel = DiseaseModel();

  XFile? imageFile;
  bool isGen = false;

  void setGen() {
    isGen = !isGen;
  }

  Future<void> addImage(BuildContext context, bool isCamera) async {
    if (isCamera) {
      imageFile = await CameraHelper.takeImages();
    } else {
      imageFile = await CameraHelper.selectImages();
    }

    if (context.mounted) {
      imageViewPopup(
        title: AppStrings.plantDiseasePrediction,
        desc: AppStrings.plantDiseasePredictionDesc,
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
      );
    }

    setGen();
  }

  void process() async {
    Function(int, int)? onSendProgress;

    BaseAPIResponse response =
        await service.predictDisease(imageFile!, onSendProgress, UrlConstants.getDiseaseEndpoint());
    if (response.error) {
      EasyLoading.dismiss();
      Navigator.pop(NavigationService.navigatorKey.currentContext!);
      Utils.showSnackBar(
          'Something went wrong -- ${response.status}', NavigationService.navigatorKey.currentContext!);
    } else {
      try {
        EasyLoading.dismiss();
        diseaseModel = diseaseStatic.firstWhere((element) => element.key == response.data['predicted_class']);
        // diseaseModel = diseaseStatic.firstWhere((element) => element.key == "Black_rot_Stage_1");
        Navigator.pop(NavigationService.navigatorKey.currentContext!);
        Navigator.of(NavigationService.navigatorKey.currentContext!)
            .push(MaterialPageRoute(builder: (context) => const DiseaseDetection()));
      } catch (e) {
        EasyLoading.dismiss();
        Navigator.pop(NavigationService.navigatorKey.currentContext!);
        Utils.showSnackBar('Something went wrong', NavigationService.navigatorKey.currentContext!);
      }
    }
  }
}


// Sample reponse
// {
//     "data": {
//         "predicted_class": "Blight_Stage_2",
//         "predicted_probabilities": "0.8442887"
//     },
//     "status_code": 200,
//     "success": true
// }