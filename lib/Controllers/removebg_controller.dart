import 'dart:io';
import 'package:bg_fly/Models/image_model.dart';
import 'package:bg_fly/Requests/bg_api_response.dart';
import 'package:bg_fly/Services/removebg_service.dart';
import 'package:bg_fly/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:permission_handler/permission_handler.dart';

class RemoveBgController with ChangeNotifier {
  final RemoveBgService bgService = RemoveBgService();
  final ImageModel image;
  File? _nonBgImage;

  String _pageTitle = "";
  BgControllerState _currentState = BgControllerState.removing;

  RemoveBgController(this.image);

  BgControllerState get currentState => _currentState;
  void setPageTitle(String title) {
    _pageTitle = title;
    notifyListeners();
  }

  String get pageTitle => _pageTitle;
  void setCurrentState(BgControllerState state) {
    _currentState = state;
    notifyListeners();
  }

  File? get nonBgImage => _nonBgImage;

  void setNonBgImage(File file) {
    _nonBgImage = file;
    notifyListeners();
  }

  void init(BuildContext context) async {
    switch (image.removalType) {
      case RemovalType.automatic:
        final BgApiResponse response =
            await bgService.removeBackground(image.image);
        handleResponse(response);

        break;
      case RemovalType.manual:
        final BgApiResponse response =
            await bgService.removeBgOffline(image.image, context);
        handleResponse(response);
        break;
      default:
    }
  }

  void handleResponse(BgApiResponse response) {
    if (response.status == ApiResponseState.error) {
      setCurrentState(BgControllerState.error);
    } else {
      setCurrentState(BgControllerState.removed);
      if (response.noBgImage != null) {
        setNonBgImage(response.noBgImage!);
      } else {
        setCurrentState(BgControllerState.error);
      }
    }
  }

  Future<void> saveImage(context) async {
    try {
      // Request permissions to access external storage
      await Permission.storage.request();

      var imageBytes = nonBgImage!.readAsBytesSync();
      await ImageGallerySaver.saveImage(imageBytes,
          quality: 100, name: "no-bg-${DateTime.now().millisecondsSinceEpoch}");
      // Show a SnackBar after saving

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Image saved successfully!"),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      setCurrentState(BgControllerState.error);
    }
  }
}
