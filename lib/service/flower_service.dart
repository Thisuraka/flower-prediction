import 'package:dio/dio.dart';
import 'package:flower_prediction/models/base_api_response.dart';
import 'package:flower_prediction/network/network.dart';
import 'package:image_picker/image_picker.dart';

class FlowerService {
  Future<BaseAPIResponse> predictGrowth(
      XFile imageFile, int month, Function(int, int)? onSendProgress, String endpoint) async {
    FormData formData = FormData.fromMap({
      "image_path": await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.name,
      ),
      "month": month,
    });
    BaseAPIResponse response =
        await Network.upload(formData: formData, endpoint: endpoint, onSendProgress: onSendProgress);
    return response;
  }
}
