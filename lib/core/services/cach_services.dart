import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheServices {
  late SharedPreferences shared;
  Future<bool> init() async {
    try {
      shared = await SharedPreferences.getInstance();
      //shared.clear();

      return true;
    } on Exception catch (e) {
      if (kDebugMode) print(e);
      return false;
    }
  }
}