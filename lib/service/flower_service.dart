import 'package:dio/dio.dart';
import 'package:flower_prediction/models/base_api_response.dart';
import 'package:flower_prediction/network/network.dart';
import 'package:flower_prediction/utils/enums/request_types.dart';
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

  Future<BaseAPIResponse> predictDisease(
      XFile imageFile, Function(int, int)? onSendProgress, String endpoint) async {
    FormData formData = FormData.fromMap({
      "image_path": await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.name,
      )
    });
    BaseAPIResponse response =
        await Network.upload(formData: formData, endpoint: endpoint, onSendProgress: onSendProgress);
    return response;
  }

  Future<BaseAPIResponse> predictFlower(String endpoint, Map<String, dynamic> body) async {
    BaseAPIResponse response = await Network.request(url: endpoint, method: RequestType.post, body: body);
    return response;
  }

  Future<BaseAPIResponse> closestVendor(String endpoint, Map<String, dynamic> body) async {
    BaseAPIResponse response = await Network.request(url: endpoint, method: RequestType.post, body: body);
    return response;
  }

  Future<BaseAPIResponse> costCalculation(String endpoint, Map<String, dynamic> body) async {
    BaseAPIResponse response = await Network.request(url: endpoint, method: RequestType.post, body: body);
    return response;
  }
}
