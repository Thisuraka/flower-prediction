import 'dart:io';
import 'package:flower_prediction/service/flower_service.dart';
import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/utils/camera_helper.dart';
import 'package:flower_prediction/utils/navigation_service.dart';
import 'package:flower_prediction/widgets/common_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

class FlowerViewModel extends ChangeNotifier {
  final FlowerService service = FlowerService();

  XFile? imageFile;
  bool isGen = false;
  bool isCamera = false;

  void setGen() {
    isGen = !isGen;
  }

  Future<void> addImage(BuildContext context) async {
    if (isCamera) {
      imageFile = await CameraHelper.takeImages();
    } else {
      imageFile = await CameraHelper.selectImages();
    }

    // ignore: use_build_context_synchronously
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.cancel,
                  color: greenLvl1,
                  size: 30,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                margin: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.file(File(imageFile!.path)),
                ),
              ),
              CommonButtonWidget(
                text: "Continue",
                size: MediaQuery.of(context).size.width / 1.3,
                onTap: () {
                  EasyLoading.instance
                    ..displayDuration = const Duration(milliseconds: 2000)
                    ..indicatorColor = Colors.white
                    ..maskColor = const Color(0xDA1B0130)
                    ..textColor = greenLvl1
                    ..dismissOnTap = false;
                  EasyLoading.show(status: 'loading...');
                },
              ),
            ]),
          ),
        );
      },
    );
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

  Future<void> dataPopup(String text) {
    return showDialog<void>(
      context: NavigationService.navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0.0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          alignment: Alignment.center,
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.cancel,
                      color: greenLvl1,
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ]),
          ),
        );
      },
    );
  }
}
