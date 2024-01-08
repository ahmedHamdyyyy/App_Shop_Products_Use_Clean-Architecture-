import 'package:flutter/material.dart';
import 'core/services/service_locator.dart';
import 'myApp.dart';
void main() async {
  setup();

  await hiveSetup();
  runApp(const MyApp());
}


