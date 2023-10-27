import 'package:flower_prediction/service/flower_service.dart';
import 'package:flower_prediction/style.dart';
import 'package:flower_prediction/views/predict_flower/predict_flower.dart';
import 'package:flutter/material.dart';

class PredictFlowerViewModel extends ChangeNotifier {
  final FlowerService service = FlowerService();

  String selectedMonthForGrowth = "";

  Future<void> addInputs(BuildContext context) async {
    if (context.mounted) {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Enter Plant Details',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter farmer location',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter soil pH value',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter growing time period',
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20), backgroundColor: greenLvl1),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PredictFlower()),
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
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
