import 'package:flutter/material.dart';

import 'package:flower_prediction/service/flower_service.dart';

class PredictFlowerViewModel extends ChangeNotifier {
  final FlowerService service = FlowerService();

  String selectedMonthForGrowth = "";

  Future<void> addInputs(BuildContext context) async {
    if (context.mounted) {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return const SizedBox(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[],
              ),
            ),
          );
        },
      );
    }
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
