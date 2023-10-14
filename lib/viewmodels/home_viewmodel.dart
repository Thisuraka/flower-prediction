import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flower_prediction/service/flower_service.dart';

class HomeViewModel extends ChangeNotifier {
  final FlowerService service = FlowerService();

  XFile? imageFile;
  bool isGen = false;
  bool isCamera = true;

  void setGen() {
    isGen = !isGen;
  }
}
