import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flower_prediction/service/flower_service.dart';
import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/camera_helper.dart';
import 'package:flower_prediction/widgets/popups/image_view_popup.dart';

class DiseaseViewModel extends ChangeNotifier {
  final FlowerService service = FlowerService();

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
          // process();
        },
      );
    }

    setGen();
  }

  void process() async {
    // Function(int, int)? onSendProgress;

    // BaseAPIResponse response =
    //     await service.uploadImage(imageFile!, onSendProgress, UrlConstants.getLiveEndpoint());
    // if (response.error) {
    //   EasyLoading.dismiss();
    //   Navigator.pop(NavigationService.navigatorKey.currentContext!);
    //   Utils.showSnackBar(
    //       'Something went wrong -- ${response.status}', NavigationService.navigatorKey.currentContext!);
    // } else {
    //   Navigator.of(NavigationService.navigatorKey.currentContext!)
    //           .push(MaterialPageRoute(builder: (context) => const ));
    //   } catch (e) {
    //     EasyLoading.dismiss();
    //     Navigator.pop(NavigationService.navigatorKey.currentContext!);
    //     Utils.showSnackBar('Something went wrong', NavigationService.navigatorKey.currentContext!);
    //   }
    // }
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