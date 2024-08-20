import 'dart:io';

import 'package:bg_fly/Models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeController with ChangeNotifier {
  late ImageModel _image;

  final picker = ImagePicker();

  bool _isSelected = false;

  File get image => _image.image;

  bool get isSelected => _isSelected;

  void setImage(File file) {
    _image = ImageModel(file, null);
  }

  void setisSelected(bool flag) {
    _isSelected = flag;
  }

  Future<void> pickImage() async {
    setisSelected(false);
    notifyListeners();
    getImageFromGallery();
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setImage(File(pickedFile.path));
      setisSelected(true);
      notifyListeners();
    }
  }
}
