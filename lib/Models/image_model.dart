import 'dart:io';

import 'package:bg_fly/utils/enums.dart';

class ImageModel {
  File image;
  RemovalType? removalType;

  ImageModel(this.image, this.removalType);
}
