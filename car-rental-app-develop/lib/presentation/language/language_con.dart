import 'package:car_rental_app/core/app_export.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  RxString lang = LocalizationService.langs.first.obs;
  TextEditingController searchController = TextEditingController(text:  "");
}
