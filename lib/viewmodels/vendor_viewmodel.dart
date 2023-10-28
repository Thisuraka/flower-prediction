import 'dart:convert';

import 'package:flower_prediction/models/base_api_response.dart';
import 'package:flower_prediction/models/closest_vendors.dart';
import 'package:flower_prediction/service/flower_service.dart';
import 'package:flower_prediction/utils/navigation_service.dart';
import 'package:flower_prediction/utils/urls.dart';
import 'package:flower_prediction/utils/utils.dart';
import 'package:flower_prediction/views/vendor/closest_vendors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';

class VendorViewModel extends ChangeNotifier {
  final FlowerService service = FlowerService();
  List<ClosestVendorsModel> closestVendors = [];

  void getClosestVendors() async {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorColor = Colors.white
      ..maskColor = const Color(0xDA1B0130)
      ..textColor = Colors.white
      ..dismissOnTap = false;

    EasyLoading.show(status: 'loading...');

    Position position = await determinePosition();

    BaseAPIResponse response = await service.predictFlower(UrlConstants.getClosestVendorsEndpoint(), {
      "user_location": [position.latitude, position.longitude]
    });
    if (response.error) {
      EasyLoading.dismiss();
      Utils.showSnackBar(
          'Something went wrong -- ${response.status}', NavigationService.navigatorKey.currentContext!);
    } else {
      try {
        EasyLoading.dismiss();
        closestVendors = response.data.map((json) => ClosestVendorsModel.fromJson(json)).toList();

        closestVendors = response.data.map((json) => ClosestVendorsModel.fromJson(json)).toList();
        print(closestVendors);
        // Navigator.push(
        //   NavigationService.navigatorKey.currentContext!,
        //   MaterialPageRoute(builder: (context) => const ClosestVendors()),
        // );
      } catch (e) {
        print(e);
        EasyLoading.dismiss();
        Utils.showSnackBar('Something went wrong -- $e', NavigationService.navigatorKey.currentContext!);
      }
    }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Utils.showSnackBar('Location permissions are disabled', NavigationService.navigatorKey.currentContext!);
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Utils.showSnackBar('Location permissions are denied', NavigationService.navigatorKey.currentContext!);
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Utils.showSnackBar('Location permissions are denied', NavigationService.navigatorKey.currentContext!);
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
