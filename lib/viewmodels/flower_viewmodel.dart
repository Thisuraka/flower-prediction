import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flower_prediction/service/flower_service.dart';
import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/camera_helper.dart';
import 'package:flower_prediction/utils/enums/processor_type.dart';
import 'package:flower_prediction/widgets/popups/image_view_popup.dart';

class FlowerViewModel extends ChangeNotifier {
  final FlowerService service = FlowerService();
  TextEditingController growthMonthInputController = TextEditingController();

  XFile? imageFile;
  bool isGen = false;
  bool isCamera = false;

  void setGen() {
    isGen = !isGen;
  }

  Future<void> addImage(BuildContext context, ProcessorType processorType) async {
    if (isCamera) {
      imageFile = await CameraHelper.takeImages();
    } else {
      imageFile = await CameraHelper.selectImages();
    }

    if (processorType == ProcessorType.growth) {
      // ignore: use_build_context_synchronously
      growthImageViewPopup(
        imageFile: imageFile,
        context: context,
        controller: growthMonthInputController,
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
    } else {
      // ignore: use_build_context_synchronously
      imageViewPopup(
        imageFile: imageFile,
        context: context,
        onTap: () {
          EasyLoading.instance
            ..displayDuration = const Duration(milliseconds: 2000)
            ..indicatorColor = Colors.white
            ..maskColor = const Color(0xDA1B0130)
            ..textColor = greenLvl1
            ..dismissOnTap = false;
          EasyLoading.show(status: 'loading...');

          switch (processorType) {
            case ProcessorType.disease:
              // process();
              break;
            case ProcessorType.predictFlower:
              // process();
              break;
            case ProcessorType.growth:
              // process();
              break;
            case ProcessorType.vendor:
              // process();
              break;
            case ProcessorType.all:
            // process();
          }
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
