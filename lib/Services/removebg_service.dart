import 'dart:io';
import 'dart:typed_data';
import 'package:bg_fly/Requests/bg_api_response.dart';
import 'package:bg_fly/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;
import 'package:remove_background/remove_background.dart';

class RemoveBgService {
  final String apiKey = "NWdEULP3j73frtxU9F6gDeis";
  RemoveBgService();

  Future<BgApiResponse> removeBackground(File image) async {
    final serviceResponse = BgApiResponse(ApiResponseState.error, null);
    try {
      final directory = await getTemporaryDirectory();
      final tempFilePath = '${directory.path}/no-bg.png';

      var request = http.MultipartRequest(
          'Post', Uri.parse('https://api.remove.bg/v1.0/removebg'));

      request.files.add(http.MultipartFile(
        'image_file',
        image.readAsBytes().asStream(),
        await image.length(),
        filename: image.uri.pathSegments.last,
      ));

      request.fields['size'] = 'auto';
      request.headers['X-Api-Key'] = apiKey;

      var response = await request.send();

      if (response.statusCode == 200) {
        final file = File(tempFilePath);
        final responseBytes = await response.stream.toBytes();
        await file.writeAsBytes(responseBytes);

        serviceResponse.noBgImage = file;
        serviceResponse.status = ApiResponseState.success;
      } else {
        serviceResponse.errorMessage = "Request Error: ${response.statusCode}";
      }
    } catch (e) {
      serviceResponse.errorMessage = "Systematic Error";
    }

    return serviceResponse;
  }

  Future<BgApiResponse> removeBgOffline(
      File imageFile, BuildContext context) async {
    final serviceResponse = BgApiResponse(ApiResponseState.error, null);
    try {
      ui.Image image = await decodeImageFromList(imageFile.readAsBytesSync());
      ByteData byteData = await cutImage(context: context, image: image);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();

      final filePath = '${tempDir.path}/processed_image.png';

      final file = File(filePath);

      await file.writeAsBytes(pngBytes);

      serviceResponse.status = ApiResponseState.success;
      serviceResponse.noBgImage = file;

      return serviceResponse;
    } catch (e) {
      serviceResponse.errorMessage = e.toString();
      return serviceResponse;
    }
  }
}
