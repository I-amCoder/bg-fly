import 'dart:io';

import 'package:bg_fly/utils/enums.dart';

class BgApiResponse {
  File? noBgImage;
  ApiResponseState status;
  String? errorMessage;

  BgApiResponse(this.status, this.noBgImage);
}
