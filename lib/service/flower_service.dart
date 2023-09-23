import 'package:flower_prediction/models/base_api_response.dart';
import 'package:flower_prediction/network/network.dart';
import 'package:image_picker/image_picker.dart';

class FlowerService {
  Future<BaseAPIResponse> uploadImage(
      XFile imageFile, Function(int, int)? onSendProgress, String endpoint) async {
    BaseAPIResponse response = await Network.upload(
        filePath: imageFile.path,
        fileName: imageFile.name,
        endpoint: endpoint,
        onSendProgress: onSendProgress);
    return response;
  }
}
