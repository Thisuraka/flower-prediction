import 'package:flower_prediction/service/flower_service.dart';
import 'package:flutter/material.dart';

class VendorViewModel extends ChangeNotifier {
  final FlowerService service = FlowerService();

  TextEditingController selectedVendor = TextEditingController();

  void proces() async {}
}
