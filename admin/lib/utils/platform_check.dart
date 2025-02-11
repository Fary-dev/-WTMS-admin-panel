import 'dart:io';

import 'package:flutter/foundation.dart';

bool isAndroid() {
  return Platform.isAndroid;
}

bool isIOS() {
  return Platform.isIOS;
}

bool isWeb() {
  return kIsWeb;
}
